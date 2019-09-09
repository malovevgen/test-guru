class User < ApplicationRecord
  has_many :test_logs
  has_many :tests, through: :test_logs
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id

  def tests_by_level(level)
    tests.where(level: level)
  end
end
