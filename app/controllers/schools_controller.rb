class SchoolsController < ApplicationController
  def index
    @schools = School.order(:created_at)
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    @student_count = @school.count_of_students
  end

  def new
  end

  def create
    school = School.create!(school_params)
    redirect_to "/schools" 
  end

  def edit
    @school = School.find(params[:id])
  end
  
  def update
    @school = School.find(params[:id])
    @school.update(school_params)
    redirect_to "/schools/#{@school.id}"
  end

  def destroy
    school = School.find(params[:id])
    school.destroy
    redirect_to "/schools"
  end
  
  private 
  
  def school_params
    params.permit(:name, :esl_program, :tuition)
  end
end