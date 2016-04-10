ActiveAdmin.register Catalog::Product do
  menu parent: 'Namespaced polymorphic case'

  actions :all, except: :show
  permit_params :title,
    image_ids: [],
    images_attributes: [:id, :position, :title, :_destroy]

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
    f.inputs do
      f.input :images, as: :dropzone
    end
    f.actions
  end
end
