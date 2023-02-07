require 'rails_helper'

RSpec.describe School, type: :model do
  it {should have_many :students}

  describe "Parent child count" do
    let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }

    let!(:student_1) {Student.create!(school: school_1, name: "John Wick", english_learner: true, grade: 2)}
    let!(:student_2) {Student.create!(school: school_1, name: "Sara Barne", english_learner: true, grade: 4)}
    let!(:student_3) {Student.create!(school: school_1, name: "Kim Lee", english_learner: true, grade: 1)}

    describe "When I visit a parent's show page" do
      it "see a count of the number of children associated with this parent" do

        expect(school_1.count_of_students).to eq(3)
      end
    end
  end
end
