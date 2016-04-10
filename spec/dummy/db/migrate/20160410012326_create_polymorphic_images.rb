class CreatePolymorphicImages < ActiveRecord::Migration
  def change
    create_table :polymorphic_images do |t|
      t.string :title
      t.references :owner, polymorphic: true, index: true
      t.attachment :attach
      t.integer :position

      t.timestamps null: false
    end
  end
end
