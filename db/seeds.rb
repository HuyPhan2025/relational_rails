# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
School.destroy_all
Student.destroy_all

#schools
school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour)
school_2 = School.create!(name: "Walnut Hill", esl_program: true, tuition: 1500,created_at: Time.now - 2.hour)
school_3 = School.create!(name: "Hogwart", esl_program: true, tuition: 2500)

#students
student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)
student_3 = Student.create!(school: school_1, name: "Kim Lee", english_learner: true, grade: 1)

student_4 = Student.create!(school: school_2, name: "Adam Bailey", english_learner: true, grade: 4)
student_5 = Student.create!(school: school_2, name: "Meredith Smith", english_learner: false, grade: 5)
student_6 = Student.create!(school: school_2, name: "Chan Sue", english_learner: true, grade: 2)

student_7 = Student.create!(school: school_3, name: "Huy Phan", english_learner: true, grade: 5)
student_8 = Student.create!(school: school_3, name: "Ivy Lai", english_learner: false, grade: 3)
student_9 = Student.create!(school: school_3, name: "Isabel Lai", english_learner: false, grade: 2)




