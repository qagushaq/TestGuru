class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", foreign_key: :user_id, optional: true

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0, less_than: 10 }

  scope :easy, -> { where(level: 0..1).order(created_at: :desc) }
  scope :medium, -> { where(level: 2..1).order(created_at: :desc) }
  scope :hard, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }
  scope :by_category, -> (title_name) { joins(:category).where(categories: { title: title_name }) }

  def self.by_category(category)
    by_category(title_name).order(title: :desc).pluck(:title)
  end

end
