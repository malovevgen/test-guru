#require 'digest/shal'

class User < ApplicationRecord

  include Auth

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  has_secure_password

  def test_passage(test)
    test_passages.order(updated_at: :desc).find_by(test_id: test.id) # order(:id)
  end

  def tests_by_level(level)
    tests.where(level: level)
  end
end
