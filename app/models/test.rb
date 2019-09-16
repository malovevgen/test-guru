class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions, dependent: :nullify
  has_many :logbooks, dependent: :destroy
  has_many :users, through: :logbooks

  validates :title, presence: true

  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :desc_title, -> { order(title: :desc) }
  scope :sort_by_categories, ->(category) {
    joins(:category)
      .where(categories: { title: category })
      .desc_title
  }

  def self.sort_categories(category)
    sort_by_categories(category).pluck(:title)
  end
end
