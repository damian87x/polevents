FactoryGirl.define do
  factory :topic, class: Topic do
    name { Faker::SlackEmoji.activity }
    created_at { Faker::Time.between(2.days.ago, Date.today, :midnight) }
  end
end