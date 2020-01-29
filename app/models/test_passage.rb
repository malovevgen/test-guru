class TestPassage < ApplicationRecord

  SUCCESS_RATE = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  def completed?
    if current_question.nil?
      self.finality = true
      if success?
        self.success = true
        badge_is?
      end
      save!
    end
  end

  def total_questions
    test.questions.count
  end

  def percent_correct
    (correct_questions.to_f * 100 / total_questions).floor
  end

  def success?
    percent_correct >= SUCCESS_RATE
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    #save!
    #self.finality = current_question.nil?
    save!
  end

  def progress
    (((current_question_number - 1).to_f / total_questions) * 100).to_i
  end

  private

  def before_validation_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', pointer).first
    end
  end

  def pointer
    if current_question.present?
      current_question.id
    else
      Question.last.id + 1
    end
  end

  def badge_is?
    user_test_passages = TestPassage.where(user: self.user)
    user_test_passages_true = user_test_passages.where(success: true)
    user_test_passages_false = user_test_passages.where(success: false)
    @user_tests_true = user_tests(user_test_passages_true)
    @user_tests_false = user_tests(user_test_passages_false)
    all_tests_backend_badge_is?
    all_level_badge_is?
    first_attempt_is?
  end

  def user_tests(test_passages)
    array = test_passages.pluck(:test_id).uniq
    Test.where(id: array)
  end
    
  def all_tests_backend_badge_is?
    if Badge.where("title='AllTestsBackend' AND status=true").present?
      category_id = Category.where(title: 'Backend').ids.first
      hash_conditions = { category_id: category_id }
      comparing_arrays(hash_conditions)
    end
  end

  def comparing_arrays(hash_conditions)
    all_array = array(Test.all, hash_conditions)
    user_array = array(@user_tests_true, hash_conditions)
    user_array == all_array
  end

  def array(tests, hash_conditions)
    tests.where(hash_conditions)
         .pluck(:id)
         .sort
  end

  def all_level_badge_is?
    if Badge.where("title='AllLevel' AND status=true").present?
      level = self.test.level
      hash_conditions = { level: level }
      comparing_arrays(hash_conditions)
    end
  end

  def first_attempt_is?
    if Badge.where("title='FirstAttempt' AND status=true").present?
      hash_conditions = {}
      comparing_arrays(hash_conditions) && @user_tests_false.nil?
    end
  end
end
