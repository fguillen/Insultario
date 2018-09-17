FactoryBot.define do
  factory :insult do
    sequence(:text) { |n| "This is the insult ##{n}" }
  end
end
