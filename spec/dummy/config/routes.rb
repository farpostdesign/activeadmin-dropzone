Rails.application.routes.draw do
  ActiveAdmin.routes(self) if defined?(ActiveAdmin)
  mount FerorGallery::Engine, at: '/'
end
