FactoryGirl.define do
  factory :event, class: Event do |f|
    f.name { Faker::Superhero.name }
    f.start_time { @start  =Faker::Time.between(Time.now, Time.now + 60.days, :day); @start}
    f.end_time { @start + (1..3).to_a.sample.hours }
    f.before(:create) do |event|
      event.city = FactoryGirl.create(:city)
      event.user = FactoryGirl.create(:user)
      event.topic = FactoryGirl.create(:topic)
    end
    f.after(:create) do |event|
      event.users << FactoryGirl.create(:filter).user
      event.users << FactoryGirl.create(:filter).user
    end
  end
end