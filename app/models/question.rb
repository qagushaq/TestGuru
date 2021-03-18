class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  validates :body, presence: true

  validate :validate_count_of_answers, on: :create

  def validate_count_of_answers
    errors.add(:title, 'Answers must be from 1 to 4') if answers.count > 4
  end

end
