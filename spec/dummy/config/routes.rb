Rails.application.routes.draw do
  ActiveAdmin.routes(self) if defined?(ActiveAdmin)
end
