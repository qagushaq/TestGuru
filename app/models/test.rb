class Test < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", foreign_key: :user_id, optional: true

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0, less_than: 10 }

  scope :easy, -> { where(level: 0..1).order(created_at: :desc) }
  scope :medium, -> { where(level: 2..1).order(created_at: :desc) }
  scope :hard, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }
  scope :by_category, -> (title_name) { joins(:category).where(categories: { title: title_name }) }

  scope :ready_tests, -> { where(in_developing: false) }

  def self.by_category(category)
    by_category(title_name).order(title: :desc).pluck(:title)
  end

  def test_to_pass?
    !(questions.empty? || questions.joins(:answers).empty?)
  end

  def time_for_pass_in_sec
    time_to_pass*60 if time_to_pass.present?
  end

end
