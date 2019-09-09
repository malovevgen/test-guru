class AddUserRefToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :user, foreign_key: true, index: { name: "author_id" }
  end
end
