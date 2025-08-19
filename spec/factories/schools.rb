FactoryBot.define do
  factory :school do
    name { "Школа №#{rand(1..100)}" }

    trait :with_classes do
      transient do
        classes_count { 3 }
      end

      after(:create) do |school, evaluator|
        create_list(:school_class, evaluator.classes_count, school:)
      end
    end
  end
end
