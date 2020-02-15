class BadgeService
  RULES = %W[category level first_attempt]

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @badges_actual = Badge.where(status: true)
    @badges = []
  end

  def select_badges
    if @test_passage.success!
      select_tests
      @badges_actual.select { |badge| RULES.include?(badge.rule) }.each do |badge|
        @badges << badge if send(badge.rule, badge)
      end
    end
    @badges
  end

  private

  def select_tests
    test_passages = @user.test_passages
    true_test_passages = test_passages.where(success: true)
    false_test_passages = test_passages.where("finality=true AND success=false")
    @true_tests = tests(true_test_passages)
    @false_tests_ = tests(false_test_passages)
  end

  def tests(test_passages)
    array = test_passages.pluck(:test_id).uniq
    Test.where(id: array)
  end

  def category(badge)
    key = 'category_id'
    value = Category.where(title: badge.value).ids.first
    condition(badge, key, value)
  end

  def level(badge)
    key = 'level'
    value = badge.value
    condition(badge, key, value)
  end

  def first_attempt(badge)
    comparing_arrays({})
  end

  def condition(badge, key, value)
    condition = {}
    condition[key.to_sym] = value
    comparing_arrays(condition) && (badge.first_attempt == false || @false_tests.nil?)
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
