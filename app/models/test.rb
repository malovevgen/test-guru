class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :nullify
  has_many :logbooks, dependent: :destroy
  has_many :users, through: :logbooks, dependent: :nullify
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.sort_categories(category)
    joins(:categories)
      .where(categories: { title: category })
      .order('tests.title DESC')
      .pluck(:title)
  end
end
