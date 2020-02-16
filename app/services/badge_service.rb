class BadgeService
  RULES = %W[category level first_attempt]

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @badges = Badge.all
  end

  def select_badges
    badges = []
    select_tests
    @badges.select { |badge| RULES.include?(badge.rule) }.each do |badge|
      badges << badge if send(badge.rule, badge)
    end
    badges
  end

  private

  def select_tests
    test_passages = @user.test_passages
    true_test_passages = test_passages.where(success: true)
    false_test_passages = test_passages.where("finality=true AND success=false")
    @true_tests = tests(true_test_passages)
    @false_tests = tests(false_test_passages)
  end

  def tests(test_passages)
    array = test_passages.pluck(:test_id).uniq
    Test.where(id: array)
  end

  def category(badge)
    value = Category.where(title: badge.value).ids.first #Category.id
    if  Test.where(category_id: value).ids.include?(@test_passage.test_id)
      # tests = @true_tests.where(category_id: value).pluck(:id).sort
      # all_tests = Test.where(category_id: value).pluck(:id).sort
      # all_tests == tests
      @true_tests.where(category_id: value).pluck(:id).sort == Test.where(category_id: value).pluck(:id).sort
    end
  end

  def level(badge)
    if Test.where(level: badge.value).ids.include?(@test_passage.test_id)
      # tests = @true_tests.where(level: badge.value).pluck(:id).sort
      # all_tests = Test.where(level: badge.value).pluck(:id).sort
      # all_tests == tests
      @true_tests.where(level: badge.value).pluck(:id).sort == Test.where(level: badge.value).pluck(:id).sort
    end
  end

  def first_attempt(badge)
    @true_tests.pluck(:id).sort == Test.all.pluck(:id).sort && @false_tests.empty?
    # comparing_arrays({}) && @false_tests.nil?
  end
end
