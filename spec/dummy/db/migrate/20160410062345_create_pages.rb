class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.references :content, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
