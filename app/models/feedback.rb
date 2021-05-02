class Feedback < ApplicationRecord

  validates :email, :message, presence: true
  
end
