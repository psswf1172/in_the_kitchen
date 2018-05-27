class CreateInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :instructions do |t|
      t.belongs_to :recipe, foreign_key: true
      t.string :step
      t.text :description

      t.timestamps
    end
  end
end
