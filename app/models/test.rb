class Test < ApplicationRecord
  belongs_to :category
  has_many :question, dependent: :nullify
  has_many :logbook, dependent: :destroy
  has_many :user, through: :logbook, dependent: :nullify
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.sort_categories(category)
    joins(:categories)
      .where(categories: { title: category })
      .order('tests.title DESC')
      .pluck(:title)
  end
end
