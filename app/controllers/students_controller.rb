class StudentsController < ApplicationController
    
    
    
    # sign up form
    def new
        @student = Student.new
    end
     #sign up
    def create
        @student = Student.new(student_params)
        if @student.save
            #log in student
            session[:student_id]=@student.id
            redirect_to student_path(@student)
        else
            render :new
        end

    end
    def show
        @student = Student.find_by_id(params[:id])
    end
  
private

def student_params
    params.require(:student).permit(:username, :email, :password)
end
end
