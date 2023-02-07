class StudentsController < ApplicationController
  def index   
    if params[:filter] == "esl"
      @students = Student.display_true 
    else 
      @students = Student.all
    end
  end

  def show
    @student = Student.find(params[:id])
  end
  
  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to "/students/#{@student.id}"
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to "/students"
  end

  private
  
  def student_params
    params.permit(:name, :english_learner, :grade)
  end
end