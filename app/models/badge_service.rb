class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
  end

  def select_badges
    @test_passage.update(finality: true)
    if @test_passage.success?
      @test_passage.update(success: true)
      badge_assignment
    end
  end

  def badge_assignment
    user_test_passages = TestPassage.where(user: @user)
    user_test_passages_true = user_test_passages.where(success: true)
    user_test_passages_false = user_test_passages.where(success: false)
    @user_tests_true = user_tests(user_test_passages_true)
    @user_tests_false = user_tests(user_test_passages_false)
    all_tests_backend_badge
    all_level_badge
    first_attempt
  end

  def user_tests(test_passages)
    array = test_passages.pluck(:test_id).uniq
    Test.where(id: array)
  end
    
  def all_tests_backend_badge
    if badge_present?('AllTestsBackend') #Badge.where("title='AllTestsBackend' AND status=true").present?
      category_id = Category.where(title: 'Backend').ids.first
      hash_conditions = { category_id: category_id }
      if comparing_arrays(hash_conditions)
        create_badge_user('AllTestsBackend')
        # BadgesUser.create!(user_id: self.user.id, badge_id: Badge.where(title:'AllTestsBackend').ids.first)
      end
    end
  end

  def all_level_badge
    if badge_present?('AllLevel') #Badge.where("title='AllLevel' AND status=true").present?
      level = self.test.level
      hash_conditions = { level: level }
      if comparing_arrays(hash_conditions)
        create_badge_user('AllLevel')
        # BadgeUser.create!(user_id: self.user.id, badge_id: Badge.where(title:'AllLevel').ids.first)
      end
    end
  end

  def first_attempt
    if badge_present?('FirstAttempt') #Badge.where("title='FirstAttempt' AND status=true").present?
      hash_conditions = {}
      if comparing_arrays(hash_conditions) && @user_tests_false.nil?
        create_badge_user('FirstAttempt')
        # BadgeUser.create!(user_id: self.user.id, badge_id: Badge.where(title:'FirstAttempt').ids.first)
      end
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

  def badge_present?(title)
    Badge.where("title=? AND status=true", title).present?
  end

  def create_badge_user(title)
    BadgesUser.create!(user_id: @user.id, badge_id: Badge.where("title=?", title).ids.first)
  end

  def timer
    Time.now
  end
end
