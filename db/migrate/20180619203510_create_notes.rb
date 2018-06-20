class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :body
      t.belongs_to :user
      t.references :notable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
