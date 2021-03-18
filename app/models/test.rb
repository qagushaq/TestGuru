class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :destroy

  scope :easy, -> { where(level: 0..1).order(created_at: :desc) }
  scope :medium, -> { where(level: 2..1).order(created_at: :desc) }
  scope :hard, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }
  scope :by_category, -> (title_name) { joins(:category).where(categories: { title: title_name }) }


  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validate :validate_max_level, on: :create

  def self.by_category(category)
    by_category(title_name).order(title: :desc).pluck(:title)
  end

  private

  def validate_max_level
    errors.add(:level) if level.to_i > 10
  end

end
