class Test < ApplicationRecord
  def self.sort_categories(category)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: category })
      .order('tests.title DESC')
      .pluck(:title)
  end
end
