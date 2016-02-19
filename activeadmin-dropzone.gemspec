$:.push File.expand_path("../lib", __FILE__)

require "activeadmin-dropzone/version"

Gem::Specification.new do |s|
  s.name = "activeadmin-dropzone"
  s.version = Activeadmin::Dropzone::VERSION
  s.authors = ["Maxim Gladkov Alexey Krylov"]
  s.date = "2016-02-08"
  s.email = "contact@maximgladkov.com alexey2142@mail.ru"
  s.homepage = "http://maximgladkov.com/blog/activeadmin-dropzone-gem"
  s.summary = "Easy to use integration of drag&drop files upload via dropzone.js for ActiveAdmin"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "activeadmin", ">= 1.0.0.pre1"
  s.add_dependency "paperclip"

  s.add_development_dependency 'rspec-rails', '3.1.0'
  s.add_development_dependency 'simplecov', '0.11.1'
  s.add_development_dependency 'pg', '0.18.3'
  s.add_development_dependency 'capybara', '2.4.4'
  s.add_development_dependency 'poltergeist', '1.6.0'
  s.add_development_dependency 'database_cleaner', '1.5.0'
  s.add_development_dependency 'byebug', '3.2.0'
  s.add_development_dependency 'faker', '1.4.3'
  s.add_development_dependency 'factory_girl_rails', '4.5.0'
end
