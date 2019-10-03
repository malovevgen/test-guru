class ChangeLogbooksToTestPassages < ActiveRecord::Migration[5.2]
  def change
    rename_table :test_passage, :test_passages
  end
end
