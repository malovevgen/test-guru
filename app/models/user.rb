class User < ApplicationRecord
  has_many :test_logs
  has_many :tests, through: :test_logs
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id

  def tests_by_level(id, level)
    Test.joins('JOIN tests_logs ON tests.id = tests_logs.test_id')
        .where(tests_logs: { user_id: id }, tests: { level:  level })
  end
end
