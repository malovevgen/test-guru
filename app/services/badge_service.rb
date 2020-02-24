class BadgeService
  RULES = %W[category level first_attempt]

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test_passages = @user.test_passages
  end

  def select_badges
    Badge.all.select do |badge|
      send(badge.rule, badge)
    end
  end

  private

  def category(badge)
    category_id = Category.find_by(title: badge.value).id

    return unless @test_passage.test.category.id == category_id

    true_tests(badge).where(category_id: category_id).pluck(:id).sort == Test.where(category_id: category_id).pluck(:id).sort
  end

  def level(badge)
    return unless @test_passage.test.level == badge.value.to_i

    true_tests(badge).where(level: badge.value).pluck(:id).sort == Test.where(level: badge.value).pluck(:id).sort
  end

  # def first_attempt(badge) # Бейдж выдается после прохождения всех тестов с первой попытки
  #   true_tests(badge).pluck(:id).sort == Test.all.pluck(:id).sort && false_tests(badge).empty?
  # end

  def first_attempt(badge) # Бейдж выдается после прохождения любого теста с первой попытки
    @test_passages.where(test_id: @test_passage.test_id).count == 1 && @test_passage.success == true
  end

  def true_tests(badge)
    Test.where(id: actual_test_passages(badge).where(success: true).pluck(:test_id).uniq)
  end

  # def false_tests(badge) # Используется если бейдж выдается после прохождения всех тестов с первой попытки
  #  Test.where(id: actual_test_passages(badge).where("finality=true AND success=false").pluck(:test_id).uniq)
  # end

  def actual_test_passages(badge)
    if @user.badges.ids.include?(badge.id)
      starting_point = @user.badges_users.where(badge_id: badge.id).order('created_at').last.created_at
      @test_passages.where(created_at: starting_point..Time.now)
    else
      @test_passages
    end
  end
end
