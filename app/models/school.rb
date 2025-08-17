class School < ApplicationRecord
  has_many :school_classes
  has_many :students

  validates :name, presence: true
end
