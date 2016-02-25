require 'rails_helper'

RSpec.describe DropzoneController, type: :controller do
  routes { Rails.application.routes }

  describe 'POST upload' do
    let(:album) { create :album }

    it 'успешно загружает файл' do
      post :upload, { dropzone_class: 'Photo', file: fixture_file_upload('spec/support/images/1.jpg', 'image/jpg'), container_id: album.id }
      expect(Photo.last.attach_file_name).to eq '1.jpg'
    end

    it 'возвращает json после загрузки файла' do
      post :upload, { dropzone_class: 'Photo', file: fixture_file_upload('spec/support/images/1.jpg', 'image/jpg'), container_id: album.id }
      expect(JSON.parse(response.body)['attach_file_name']).to eq '1.jpg'
    end

    it 'привязывает созданное фото к альбому' do
      post :upload, { dropzone_class: 'Photo', file: fixture_file_upload('spec/support/images/1.jpg', 'image/jpg'), container_id: album.id }
      expect(album.photos.exists?(attach_file_name: '1.jpg')).to eq true
    end

    it 'позволяет создать фото для не сохраненного альбома без привязки к нему' do
      post :upload, { dropzone_class: 'Photo', file: fixture_file_upload('spec/support/images/1.jpg', 'image/jpg') }
      last = Photo.last
      expect(last.attach_file_name).to eq '1.jpg'
      expect(last.album_id).to eq nil
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