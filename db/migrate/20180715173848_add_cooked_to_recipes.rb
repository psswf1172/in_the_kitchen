class AddCookedToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :cooked, :boolean, default: false, null: false
  end
end
