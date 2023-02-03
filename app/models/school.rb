class School < ApplicationRecord
  has_many :students, dependent: :destroy

  def count_of_students
    students.count
  end
end
