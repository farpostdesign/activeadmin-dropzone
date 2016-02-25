require 'rails_helper'

feature 'Интерфейс управления фотографиями при изменении альбома в панели управления', :type => :feature do
  scenario 'корректно отображает название фотографии, если оно не установлено', js: true do
    album = create :album, photos: build_list(:photo, 1, title: '')
    photo = album.photos.first
    
    visit "/admin/albums/#{album.id}/edit"
    expect(find("#album_photos_#{photo.id}_title").value).to eq ''
  end

  scenario 'переименовать фотографию', js: true do
    album = create :album, photos: build_list(:photo, 10, title: 'any photo')
    photo = album.photos.first

    visit "/admin/albums/#{album.id}/edit"
    fill_in "album_photos_#{photo.id}_title", with: 'another title for photo'
    find('input[type="submit"]').click

    expect(photo.reload.title).to eq 'another title for photo'
  end
end