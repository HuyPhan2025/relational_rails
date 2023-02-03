class SchoolsController < ApplicationController
  def index
    @schools = School.order(:created_at)
  end

  def show
    @school = School.find(params[:id])
    @student_count = @school.count_of_students
  end
end