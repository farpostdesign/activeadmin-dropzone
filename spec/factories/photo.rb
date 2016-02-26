FactoryGirl.define do
  factory :photo, :class => 'Photo' do
    title { Faker::Name.name }
    album
  end
end
