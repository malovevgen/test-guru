class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_logs
  has_many :users, through: :test_logs
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.sort_categories(category)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: category })
      .order('tests.title DESC')
      .pluck(:title)
  end
end
