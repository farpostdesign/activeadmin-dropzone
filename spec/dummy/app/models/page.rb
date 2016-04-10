class Page < ActiveRecord::Base
  belongs_to :content, polymorphic: true

  accepts_nested_attributes_for :content

  def build_content(attr = {})
    self.content = content_type.constantize.new(attr)
  end
end
