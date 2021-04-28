class Feedback < ApplicationRecord

  attr_accessor :email, :message
  validates :email, :message, presence: true

end
