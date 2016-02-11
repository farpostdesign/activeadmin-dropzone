class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string  :title
      t.timestamps
    end

    add_index :albums, :title
  end
end
