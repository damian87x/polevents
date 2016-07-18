FactoryGirl.define do
  factory :date_and_range, class: DateAndRange do
    start_time { @start = Faker::Time.between(Time.now, Time.now + 60.days, :day); @start}
    end_time { @start + (1..3).to_a.sample.hours }
    start_date { @start }
    created_at { Faker::Time.between(2.days.ago, Date.today, :midnight) }
  end
end

