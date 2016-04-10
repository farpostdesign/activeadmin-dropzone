class Album < ActiveRecord::Base
  has_many :photos, -> { ordered }

  accepts_nested_attributes_for :photos, allow_destroy: true
end
