class BadgeService
  RULES = %W[category level first_attempt]

  def initialize(test_passage)
    @test_passage = test_passage
    @test_passages = @test_passage.user.test_passages
  end

  def select_badges
    Badge.all.select do |badge|
      send(badge.rule, badge)
    end
  end

  private

  def category(badge)
    category_id = Category.find_by(title: badge.value).id
    # if  Test.where(category_id: category_id).ids.include?(@test_passage.test_id)
    return unless @test_passage.test.category.id == category_id

    true_tests.where(category_id: category_id).pluck(:id).sort == Test.where(category_id: category_id).pluck(:id).sort
    #end
  end

  def level(badge)
    # if Test.where(level: badge.value).ids.include?(@test_passage.test_id)
    return unless @test_passage.test.level == badge.value

    true_tests.where(level: badge.value).pluck(:id).sort == Test.where(level: badge.value).pluck(:id).sort
    #end
  end

  def first_attempt(badge)
    true_tests.pluck(:id).sort == Test.all.pluck(:id).sort && false_tests.empty?
  end

  def true_tests
    Test.where(id: @test_passages.where(success: true).pluck(:test_id).uniq)  
  end

  def false_tests
    Test.where(id: @test_passages.where("finality=true AND success=false").pluck(:test_id).uniq)    
  end
end
