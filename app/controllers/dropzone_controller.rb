class DropzoneController < ApplicationController
  
  def upload
    dropzone_class = params[:dropzone_class].constantize
    dropzone_object = dropzone_class.new
    dropzone_object.send "#{ dropzone_class.dropzone_field(:container_type) }=", params[:container_type] if dropzone_class.dropzone_field?(:container_type) && params[:container_type]
    dropzone_object.send "#{ dropzone_class.dropzone_field(:container_id) }=", params[:container_id] if dropzone_class.dropzone_field?(:container_id) && params[:container_id]
    dropzone_object.send "#{ dropzone_class.dropzone_field(:data) }=", params[:file]

    if dropzone_object.save
      render json: dropzone_object.as_json
    else
      render json: { errors: dropzone_object.errors }, status: 500
    end
  end

  def destroy
    dropzone_class = params[:dropzone_class].constantize
    dropzone_object = dropzone_class.find params[:id]
    dropzone_object.destroy
    render json: { result: :ok }
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

end