class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :authored_tests, class_name: 'Test', dependent: :nullify

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def tests_by_level(level)
    tests.where(level: level)
  end

end
