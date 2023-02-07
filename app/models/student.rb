class Student < ApplicationRecord
  belongs_to :school

  def self.display_true
    where(english_learner: true)
  end

  def self.order_alphabetically
    order(:name)
  end

  def self.filter_student(num)
    Student.where("grade > #{num}")
  end
end
