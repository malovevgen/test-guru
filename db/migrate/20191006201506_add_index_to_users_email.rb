class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email #, unique: true # not rolled:
                             # StandardError: An error has occurred, this and all later migrations canceled:
                             # SQLite3::ConstraintException: UNIQUE constraint failed: users.email:
                             # CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email")
  end
end
