class AddDescriptionToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :description, :text
  end
end
