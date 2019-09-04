class AddTestIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :test_id, :integer
  end
end
