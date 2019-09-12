class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :nullify
  has_many :logbooks, dependent: :destroy
  has_many :users, through: :logbooks, dependent: :nullify
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :sort_by_categories, ->(category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  }

  validates :title, presence: true
end
