class Answer < ApplicationRecord
  belongs_to :question
  scope :correct_answer, -> { where(correct: true) }
  validates :body, presence: true

  validate :validate_count_of_answers, on: :create

  def validate_count_of_answers
    errors.add(:title, 'Answers must be from 1 to 4') if question.answers.count > 4
  end

end
