class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.text :name
      t.text :description
      t.text :course
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
