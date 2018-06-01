class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :description
      t.text :author
      t.belongs_to :user, index: true
      t.text :type, null: false

      t.timestamps
    end
  end
end
