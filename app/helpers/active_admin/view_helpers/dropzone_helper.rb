module ActiveAdmin::ViewHelpers::DropzoneHelper

  def render_mock_dropzone_files(dropzone_objects)
    dropzone_objects.map.with_index do |dropzone_object, index|
      {
        id: dropzone_object.id,
        name: dropzone_object.send(dropzone_object.class.dropzone_field(:title)).squish,
        size: dropzone_object.send(dropzone_object.class.dropzone_field(:file_size)),
        url: dropzone_object.send(dropzone_object.class.dropzone_field(:url)),
        index: index,
      }
    end.to_json.html_safe
  end

end
