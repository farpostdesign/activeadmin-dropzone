module Activeadmin
  module Dropzone
    extend ActiveSupport::Concern

    module ClassMethods
      def dropzone_item(options = {})
        options = {
          title: :title,
          position: :position,
          data: :data,
          file_size: :data_file_size,
          url: :data_url,
        }.deep_merge(options)

        class_eval %Q(
          def self.dropzone_field(key)
            #{ options }[key.to_sym]
          end

          def self.dropzone_field?(key)
            #{ options }.keys.include? key.to_sym
          end

          def data_url
            #{ options[:data] }.url
          end

          def as_json(options = { })
            super(options).merge({
              url: data_url,
              title: title
            })
          end
        )
      end
    end
  end
end

ActiveRecord::Base.send :include, Activeadmin::Dropzone