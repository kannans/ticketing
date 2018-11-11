FactoryBot.define do
  factory :ticket do
    sequence(:name) { |i| "Student#{i}" }
  end

  factory :excavator do
    sequence(:name) { |i| "Klass#{i}" }
  end
end
