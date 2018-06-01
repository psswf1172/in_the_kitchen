class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.text :quantity
      t.text :measurement
      t.text :name
      t.text :description
      t.belongs_to :recipe, index: true

      t.timestamps
    end
  end
end
