class SchoolClassSerializer < Panko::Serializer
  attributes :id, :number, :letter, :students_count

  def students_count
    object.students.size
  end
end
