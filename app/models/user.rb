#require 'digest/shal'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_reader :password
  attr_writer :password_confirmation

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :name, :email, presence: true
  validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
  validates :password, confirmation: true
  validates :email, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP}

  has_secure_password

  def test_passage(test)
    test_passages.order(updated_at: :desc).find_by(test_id: test.id) # order(:id)
  end

  def tests_by_level(level)
    tests.where(level: level)
  end
end
