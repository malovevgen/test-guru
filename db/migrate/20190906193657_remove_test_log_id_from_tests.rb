class RemoveTestLogIdFromTests < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :test_log_id, :integer
  end
end
