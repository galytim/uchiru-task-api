school = School.create!(name: "Школа для детей солнца")
school.school_classes.create!(number: 2, letter: "A")
puts "Data successfully seeded"