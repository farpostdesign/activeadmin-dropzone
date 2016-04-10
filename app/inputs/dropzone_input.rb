class DropzoneInput
  include Formtastic::Inputs::Base

  def to_html
    template.render 'dropzone',
      object: object,
      object_name: object_name,
      options: options,
      method: method
  end

end
