class BadgesService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      reward(badge) if send("#{badge.rule}?".to_sym, badge.rule) && !UserBadge.find_by(user_id: @user.id, badge_id: badge.id)
    end
  end

  def reward(badge)
    @user.badges << badge
  end

  def category_completed?(category_id)
    user_passed_tests_by_category = @user.tests.joins(:categories).where(category_id: category_id).distinct.size
    all_tests_category = Category.find(category_id).tests.size
    all_tests_category == user_passed_tests_by_category
  end

  def success_first_try?(test_id)
    @user.passed_tests.where(test_id: test_id).order(:updated_at).first.success_passed.count == 1
  end

  def level_complete?(level)
    user_passed_tests_by_level = @user.tests.distinct(:test_id).where(level: level).size
    all_tests_level = Test.where(level: level).size
    user_passed_tests_by_level == all_tests_level
  end

end
