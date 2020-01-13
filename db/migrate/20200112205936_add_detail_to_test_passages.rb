class AddDetailToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :finality, :boolean, default: false
    add_column :test_passages, :success, :boolean, default: false
  end
end
