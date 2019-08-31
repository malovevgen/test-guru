class DropTableQuestions < ActiveRecord::Migration[5.2]
  def change
    drop_table :questions do |t|
    end
  end
end
