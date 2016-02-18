require 'rails_helper'

module ActiveAdmin::ViewHelpers
  RSpec.describe DropzoneHelper do
    describe '#dropzone_object_title' do
      it 'возвращает title фото' do
        photo = create :photo, title: 'photo name'
        expect(helper.dropzone_object_title photo).to eq 'photo name'
      end

      it 'возвращает title по-умолчанию' do
        photo = create :photo, title: ''
        expect(helper.dropzone_object_title photo).to eq 'Изображение #2'
      end
    end

    describe '#render_mock_dropzone_files' do
      it 'возвращает строку с json-представлением коллекции объектов' do
        photo1 = create :photo, title: 'photo 1'
        photo2 = create :photo, title: 'photo 2'
        photo3 = create :photo, title: 'photo 3'
        result = "[{\"id\":#{photo1.id},\"title\":\"photo 1\",\"size\":null,\"url\":\"/attaches/original/missing.png\",\"index\":0},{\"id\":#{photo2.id},\"title\":\"photo 2\",\"size\":null,\"url\":\"/attaches/original/missing.png\",\"index\":1},{\"id\":#{photo3.id},\"title\":\"photo 3\",\"size\":null,\"url\":\"/attaches/original/missing.png\",\"index\":2}]"
        expect(helper.render_mock_dropzone_files [photo1, photo2, photo3]).to eq result
      end
    end
  end
end