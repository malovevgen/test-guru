class ChangeTestslogToLogbook < ActiveRecord::Migration[5.2]
  def change
    rename_table :tests_logs, :logbooks 
   end
end
