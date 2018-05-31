class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :caption
      t.belongs_to :user, index: true
      
      t.timestamps
    end
  end
end
