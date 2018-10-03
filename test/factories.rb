FactoryBot.define do
  factory :insult do
    sequence(:text) { |n| "This is the insult ##{n}" }
  end

  factory :user do
  end

  factory :insult_card do
    insult
    user
  end
end
