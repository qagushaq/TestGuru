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

  def all_tests_category_complete?
    category = @test.category
    TestPassage.where(user: @user, test: @test).select(&:completed?).map(&:test_id).uniq.count == category.tests.count
  end

  def success_first_try?
    @test_passage.completed? && @user.tests.where(title: @test_passage.test.title).count == 1
  end

  def all_tests_level_complete?
    level = @test.level
    @test_passage.completed? && @user.tests.where(level: level).uniq.count == Test.where(level: level).count
  end

end
