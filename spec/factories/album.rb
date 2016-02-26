FactoryGirl.define do
  factory :album, :class => 'Album' do
    title { Faker::Name.name }
  end
end
