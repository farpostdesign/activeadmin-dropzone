class DropzoneInput 
  include Formtastic::Inputs::Base

  def to_html
    template.render 'dropzone', object: object, options: options, method: method unless object.new_record?
  end

end