class Student < ApplicationRecord
  belongs_to :school
  belongs_to :school_class, foreign_key: :class_id

  validates :first_name, :last_name, :surname, :school_id, :class_id, presence: true
end