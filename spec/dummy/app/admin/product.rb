ActiveAdmin.register Product do
  menu parent: 'Polymorphic case'

  actions :all, except: :show
  permit_params :title,
    polymorphic_image_ids: [],
    polymorphic_images_attributes: [:id, :position, :title, :_destroy]

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
      f.input :polymorphic_images, as: :dropzone
    end
    f.actions
  end
end
