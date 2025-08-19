FactoryBot.define do
  factory :school_class do
    number { rand(1..11) }
    letter { ("А".."Е").to_a.sample }
    school
  end
end
