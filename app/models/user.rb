class User < ApplicationRecord
  has_many :logbooks, dependent: :destroy
  has_many :tests, through: :logbooks
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :name, :email, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
