FactoryBot.define do
  factory :student do
    first_name { "Вячеслав" }
    last_name { "Абдурахмангаджиевич" }
    surname { "Мухобойников-Сыркин" }

    association :school
    association :school_class, factory: :school_class
  end
end
