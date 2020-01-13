class TestPassage < ApplicationRecord

  SUCCESS_RATE = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  def completed?
    if current_question.nil?
      self.finality = true
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
      100
    end
  end
end
