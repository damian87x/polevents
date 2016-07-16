FactoryGirl.define do
  factory :event, class: Event do |f|
    f.name { Faker::Superhero.name }
    f.start_time { Faker::Time.between(Date.today, Date.today + 60.days, :day) }
    f.before(:create) do |event|
      event.city = FactoryGirl.create(:city)
      event.user = FactoryGirl.create(:user)
      event.topic = FactoryGirl.create(:topic)
    end
  end
end