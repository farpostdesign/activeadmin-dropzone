class CreateAttachmentImages < ActiveRecord::Migration
  def change
    create_table :attachment_images do |t|
      t.string :title
      t.references :owner, polymorphic: true, index: true
      t.attachment :attach
      t.integer :position

      t.timestamps null: false
    end
  end
end
