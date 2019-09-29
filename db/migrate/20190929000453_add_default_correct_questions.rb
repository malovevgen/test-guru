class AddDefaultCorrectQuestions < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:test_passages, :correct_questions, from: nil, to: 0)
  end
end
