class Gist < ApplicationRecord

  belongs_to :question
  belongs_to :user

  scope :gists_with_question_url_email, -> { select(:email, :question_id, :body, :gist_url).joins(:user, :question) }

end
