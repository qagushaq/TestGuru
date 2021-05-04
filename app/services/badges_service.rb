class BadgesService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      reward(badge) if send("#{badge.rule}?")
    end
  end

  def reward(badge)
    @user.badges << badge
  end

  def category_completed?
    user_passed_tests_by_category = @user.passed_tests.where(category_id: category_id ).distinct.size
    all_tests_category = Category.find(category_id).tests.size
    all_tests_category == user_passed_tests_by_category
  end

  def success_first_try?
    @user.tests.where(test_id: test_id).order(:updated_at).first.success_passed
  end

  def level_complete?
    user_passed_tests_by_level = @user.passed_tests.distinct(:test_id).where(level: level).size
    all_tests_level = Test.where(level: level).size
    user_passed_tests_by_level == all_tests_level
  end

end
