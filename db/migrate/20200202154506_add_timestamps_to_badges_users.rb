class AddTimestampsToBadgesUsers < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :badges_users
  end
end
