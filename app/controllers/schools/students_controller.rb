class Schools::StudentsController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    @students = @school.students
  end

  def new
    @school = School.find(params[:school_id])
  end

  def create
    school = School.find(params[:school_id])
    student = school.students.create!(student_params)
    redirect_to "/schools/#{school.id}/students"
  end

  def student_params
    params.permit(:name, :english_learner, :grade)
  end
end

# module Schools
#   class StudentsController < ApplicationController
#     def index
#       @school = School.find(params[:school_id])
#       @students = @school.students
#     end
#   end
# end