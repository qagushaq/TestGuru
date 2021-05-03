class Badge < ApplicationRecord
  
  has_many :user_badges
  has_many :users, through: :user_badges
  validates :title, :icon, :rule, presence: true

  BADGE_RULES = {
      'Passing all tests in a category' => :all_tests_category_complete,
      'Passing the test successfully on the first try' => :success_first_try,
      'Passing all tests of a certain level' => :all_tests_level_complete
  }.freeze

end
