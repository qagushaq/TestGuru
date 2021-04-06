class User < ApplicationRecord
  has_many :test_user
  has_many :tests, through: :test_user, dependent: :destroy
  has_many :authored_tests, class_name: 'Test', dependent: :nullify

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def tests_by_level(level)
    tests.where(level: level)
  end

end
