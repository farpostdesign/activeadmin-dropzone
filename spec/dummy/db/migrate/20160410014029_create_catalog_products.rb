class CreateCatalogProducts < ActiveRecord::Migration
  def change
    create_table :catalog_products do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
