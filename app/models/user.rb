require 'digest/shal'

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :name, :email, presence: true

  def test_passage(test)
    test_passages.order(updated_at: :desc).find_by(test_id: test.id) # order(:id)
  end

  def tests_by_level(level)
    tests.where(level: level)
  end

  def authenticate(password_string)
    digest(password_string) == self.password_string ? self : false
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
