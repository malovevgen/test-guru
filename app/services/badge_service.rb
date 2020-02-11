class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @badges_actual = Badge.where(status: true)
    @badges = []
  end

  def select_badges
    @test_passage.success!
    select_tests
    @badges
  end

  def select_tests
    test_passages = @user.test_passages
    true_test_passages = test_passages.where(success: true)
    false_test_passages = test_passages.where(success: false)
    @true_tests = tests(true_test_passages)
    @false_tests_ = tests(false_test_passages)
    badge_assignment
  end

  def tests(test_passages)
    array = test_passages.pluck(:test_id).uniq
    Test.where(id: array)
  end

  def badge_assignment
    @badges_actual.each do |badge|
      if badge.rule == 'Category'
        key = 'category_id'
        value = Category.where(title: badge.value).ids.first
      elsif badge.rule == 'Level'
        key = 'level'
        value = badge.value
      end
      condition = {}
      condition[key.to_sym] = value
      @badges << badge if comparing_arrays(condition) && (badge.first_attempt == false || @false_tests.nil?)
    end
  end

  def comparing_arrays(condition)
    all_array = array(Test.all, condition)
    user_array = array(@true_tests, condition)
    user_array == all_array
  end

  def array(tests, condition)
    tests.where(condition)
         .pluck(:id)
         .sort
  end
end
