class Catalog::Product < ActiveRecord::Base
  has_many :images, -> { ordered }, as: :owner, class_name: 'Attachment::Image'

  accepts_nested_attributes_for :images, allow_destroy: true
end
