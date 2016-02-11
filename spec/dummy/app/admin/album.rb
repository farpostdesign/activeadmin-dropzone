ActiveAdmin.register Album do
  actions :all, except: :show
  permit_params :title, photos_attributes: [:id, :position, :title, :_destroy]

  index do
    selectable_column
    id_column
    column :title
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title
    end
    unless f.object.new_record?
      f.inputs do
        f.input :photos, as: :dropzone
      end
    end
    f.actions
  end
end