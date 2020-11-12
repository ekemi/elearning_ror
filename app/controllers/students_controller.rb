class StudentsController < ApplicationController
    # sign up form
    def new
        @student = Student.new
    end
     #sign up
    def create

    end
  
private

def student_params
    params.require(:student).permit(:username, :email, :password)
end
end
