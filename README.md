# activeadmin-dropzone [![Gem Version](https://badge.fury.io/rb/activeadmin-dropzone.png)](http://badge.fury.io/rb/activeadmin-dropzone)

Easy to use integration of drag&drop files upload via [dropzone.js](http://www.dropzonejs.com) for [ActiveAdmin](http://www.activeadmin.info).

## History

* 28.09.2015 - changes model association: deleted self-written association, add `accepts_nested_attributes_for`. 

## Requirements

* [ActiveAdmin](http://www.activeadmin.info);
* [Paperclip](https://github.com/thoughtbot/paperclip) gem;
* ActiveRecord;
* Separate models for file's container and files.

## Install

Add line to your Gemfile:

    gem 'activeadmin-dropzone', github: 'farpostdesign/activeadmin-dropzone'

Add `dropzone_item` to your file's class:

    class Image
        dropzone_item container_id: :page_id
    end

Add permitions to `permit_params` method for your Active Admin file, for example:

    permit_params :title,
                :annotation,
                :description,
                ...,
                image_ids: [], # for model Image
                images_attributes: [:id, :title, :position, :_destroy] # for model Image

Add `input` to your ActiveAdmin form:

    f.input :images, as: :dropzone
 
Add `activeadmin-dropzone` to both `active_admin.js` and `active_admin.css` files:

    //= require activeadmin-dropzone

## Configuration

You can customize columns used for upload by passing `Hash` to the `dropzone_item` method. Here are the default values:

    dropzone_item title: :title, 
                  position: :position, 
                  data: :data, 
                  file_size: :data_file_size, 
                  url: :data_url,
                  container_type: :page_type, # only for polymorphic associations!
                  container_id: :page_id, # required!

## Contributing to activeadmin-dropzone
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 Maxim Gladkov. See LICENSE.txt for
further details.
