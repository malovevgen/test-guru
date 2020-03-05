#require 'digest/shal'

class User < ApplicationRecord

  attr_reader :password
  attr_writer :password_confirmation

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :gists, dependent: :destroy
  has_many :badges_users, dependent: :destroy
  has_many :badges, through: :badges_users

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  def test_passage(test)
    test_passages.order(updated_at: :desc).find_by(test_id: test.id) # order(:id)
  end

  def tests_by_level(level)
    tests.where(level: level)
  end

  def admin?
    is_a?(Admin)
  end
end
