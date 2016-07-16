FactoryGirl.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    created_at { Faker::Time.between(2.days.ago, Date.today, :midnight) }
    password { Faker::Internet.password }
  end
end