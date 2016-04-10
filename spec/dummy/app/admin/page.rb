ActiveAdmin.register Page do
  menu parent: 'Deep nested case'

  actions :all, except: :show

  permit_params :title,
    :content_type,
    content_attributes: [
      :id,
      :title,
      photo_ids: [],
      photos_attributes: [:id, :title, :position, :_destroy]
    ]

  form do |f|
    f.inputs 'Page' do
      f.input :title
      f.input :content_type, as: :hidden
    end

    f.inputs 'Album', for: :content do |fc|
      fc.input :title
    end
    f.inputs 'Photos', for: :content do |fc|
      fc.input :photos, as: :dropzone
    end

    f.actions
  end

  controller do
    def new
      new! do
        @page.content = Album.new
      end
    end
  end
end
