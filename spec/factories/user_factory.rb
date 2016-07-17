FactoryGirl.define do
  factory :user, class: User do |f|
    f.email { Faker::Internet.email }
    f.created_at { Faker::Time.between(2.days.ago, Date.today, :midnight) }
    f.password { Faker::Internet.password }
  end
end