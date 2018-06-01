class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.text :title
      t.text :content
      t.text :author
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
