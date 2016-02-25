class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :album, index: true
      t.string :title
      t.integer :position
      t.attachment :attach
      t.timestamps
    end

    add_index :photos, :position
  end
end
