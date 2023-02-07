require 'rails_helper'

RSpec.describe Student, type: :model do
  it {should belong_to :school}

  describe "When I visit the child index" do
    let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }

    let!(:student_1) {Student.create!(school: school_1, name: "John Wick", english_learner: true, grade: 2)}
    let!(:student_2) {Student.create!(school: school_1, name: "Sara Barne", english_learner: true, grade: 4)}
    let!(:student_3) {Student.create!(school: school_1, name: "Kim Lee", english_learner: false, grade: 1)}
    
    it "only see records where the boolean column is `true`" do
      expect(Student.display_true.to_a).to eq([student_1, student_2])
    end
    
    it "see the students in alphabetical order" do
      expect(Student.order_alphabetically.to_a).to eq([student_1, student_3, student_2])
    end

    it "can filter students by grade" do
      expect(Student.filter_student(3).to_a).to eq([student_2])
    end
  end
end
