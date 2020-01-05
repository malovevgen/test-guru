class AddStatusToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :status, :boolean
  end
end
