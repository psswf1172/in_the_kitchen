class CreateInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table :instructions do |t|
      t.belongs_to :recipe, index: true
      t.text :description

      t.timestamps
    end
  end
end
