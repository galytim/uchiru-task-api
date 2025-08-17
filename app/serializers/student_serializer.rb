class StudentSerializer < Panko::Serializer
  attributes :id, :first_name, :last_name, :surname, :school_id, :class_id
end
