class DropTableTests < ActiveRecord::Migration[5.2]
  def change
    drop_table :tests do |t|
    end
  end
end
