class ChangeLogbookToTestPassage < ActiveRecord::Migration[5.2]
  def change
    rename_table :logbooks, :test_passage
  end
end
