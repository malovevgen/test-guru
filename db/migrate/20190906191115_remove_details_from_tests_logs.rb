class RemoveDetailsFromTestsLogs < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tests_logs, :user_id, foreign_key: true
    remove_reference :tests_logs, :test_id, foreign_key: true
  end
end
