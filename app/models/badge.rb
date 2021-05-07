class Badge < ApplicationRecord

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :rule, :image, :value, presence: true

  BADGE_RULES = {
      'Passing all tests in a category' => :category_completed,
      'Passing the test successfully on the first try' => :success_first_try,
      'Passing all tests of a certain level' => :level_complete
  }.freeze

  def self.images
    image_icons_path = "assets/images/badges/*"
    badges = Dir.glob(image_icons_path)
    badges.map { |badge_path| badge_path.gsub(image_icons_path, '') }
  end

end
