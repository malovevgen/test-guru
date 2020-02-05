class AddDetailsToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :rule, :string
    add_column :badges, :value, :string
    add_column :badges, :first_attempt, :boolean
  end
end
