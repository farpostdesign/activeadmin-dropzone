class Product < ActiveRecord::Base
  has_many :polymorphic_images, -> { ordered }, as: :owner

  accepts_nested_attributes_for :polymorphic_images, allow_destroy: true
end
