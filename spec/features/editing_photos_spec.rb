require 'rails_helper'

feature 'Редактирование фотографий', :type => :feature do
  scenario 'Корректно отображает название фотографии, если оно не установлено', js: true do
    album = create :album, photos: build_list(:photo, 1, title: '')
    photo = album.photos.first

    visit "/admin/albums/#{album.id}/edit"
    expect(find("#album_photos_#{photo.id}_title").value).to eq ''
  end

  scenario 'Переименовать фотографию', js: true do
    album = create :album, photos: build_list(:photo, 10, title: 'any photo')
    photo = album.photos.first

    visit "/admin/albums/#{album.id}/edit"
    fill_in "album_photos_#{photo.id}_title", with: 'another title for photo'
    find('input[type="submit"]').click

    expect(photo.reload.title).to eq 'another title for photo'
  end
end
