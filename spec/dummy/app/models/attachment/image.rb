class Attachment::Image < ActiveRecord::Base
  dropzone_item data: :attach,
                file_size: :attach_file_size,
                url: :data_url,
                container_type: :owner_type,
                container_id: :owner_id

  belongs_to :owner, polymorphic: true

  has_attached_file :attach, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: '/images/missing/missing.jpg'

  validates_attachment :attach, size: { in: 0..2097152 }
  validates_attachment_content_type :attach, content_type: ['image/png', 'image/jpeg', 'image/jpg']

  scope :ordered,   -> { order :position }
end
