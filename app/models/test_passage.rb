class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  PERCENTS_SUCCESS = 85

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def success?
    percent >= PERCENTS_SUCCESS
  end

  def progress_percent
    ((current_question_number.to_f - 1) / total_questions * 100).round
  end

  def percent
    (correct_question.to_f * 100 / test.questions.count).round
  end

  def total_questions
    test.questions.size
  end

  def current_question_number
    if next_question || current_question
      test.questions.order(:id).where('id < ?', current_question).count + 1
    else
      test.questions.count
    end
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.order(:id).first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort unless answer_ids.nil?
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question&.id).first
  end

end
