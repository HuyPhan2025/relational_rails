class Student < ApplicationRecord
  belongs_to :school

  def self.display_true
    where(english_learner: true)
  end

  def self.order_alphabetically
    order(:name)
  end
end
