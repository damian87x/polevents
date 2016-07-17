FactoryGirl.define do
  factory :filter, class: Filter do |f|
    f.before(:create) do |event|
      event.user = FactoryGirl.create(:user)
      event.owner = FactoryGirl.create(:topic)
    end
  end
end