school1 = School.create!(name: "Школа для крутых мужиков")
school2 = School.create!(name: "Школа для прекрасных дам")
school3 = School.create!(name: "Школа для всех остальных")
school1.school_classes.create!(number: 2, letter: "A")
school1.school_classes.create!(number: 11, letter: "Б")
school1.school_classes.create!(number: 3, letter: "В")
school1.school_classes.create!(number: 2, letter: "Г")

school2.school_classes.create!(number: 10, letter: "A")
school2.school_classes.create!(number: 9, letter: "Б")
school2.school_classes.create!(number: 8, letter: "В")
school2.school_classes.create!(number: 7, letter: "Г")

school3.school_classes.create!(number: 3, letter: "A")
school3.school_classes.create!(number: 4, letter: "Б")
school3.school_classes.create!(number: 5, letter: "В")
school3.school_classes.create!(number: 6, letter: "Г")
puts "Data successfully seeded"
