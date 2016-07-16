FactoryGirl.define do
  factory :city, class: City do
    name { Faker::GameOfThrones.city }
    created_at { Faker::Time.between(2.days.ago, Date.today, :midnight) }
  end
end