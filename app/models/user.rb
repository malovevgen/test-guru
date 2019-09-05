class User < ApplicationRecord
  def tests_by_level(id, level)
    Test.joins('JOIN tests_logs ON tests.id = tests_logs.test_id')
        .where('tests_logs.user_id = ? AND tests.level = ?', id, level)
  end
end
