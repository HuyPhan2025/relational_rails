class Schools::StudentsController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    @students = @school.students
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