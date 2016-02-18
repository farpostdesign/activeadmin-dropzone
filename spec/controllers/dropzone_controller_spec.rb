require 'rails_helper'

RSpec.describe DropzoneController, type: :controller do
  routes { Rails.application.routes }

  describe 'POST upload' do
    before :each do
      @album = create :album
      post :upload, { dropzone_class: 'Photo', file: fixture_file_upload('spec/support/images/1.jpg', 'image/jpg'), dropzonable_id: @album.id }
    end

    it 'успешно загружает файл' do
      expect(Photo.last.attach_file_name).to eq '1.jpg'
    end

    it 'возвращает json после загрузки файла' do
      expect(JSON.parse(response.body)['attach_file_name']).to eq '1.jpg'
    end

    it 'привязывает созданное фото к альбому' do
      expect(@album.photos.exists?(attach_file_name: '1.jpg')).to eq true
    end
  end

  describe 'DELETE destroy' do
    it 'успешно удаляет файл' do
      @photo = create :photo
      delete :destroy, { dropzone_class: 'Photo', id: @photo.id }
      expect(Photo.exists?(@photo.id)).to eq false
    end

    it 'возвращает OK после удаления файла' do
      @photo = create :photo
      delete :destroy, { dropzone_class: 'Photo', id: @photo.id }
      expect(JSON.parse(response.body)['result']).to eq 'ok'
    end

    it 'возвращает 404 для несуществующего файла' do
      delete :destroy, { dropzone_class: 'Photo', id: 123 }
      expect(response.status).to eq 404
    end
  end
end