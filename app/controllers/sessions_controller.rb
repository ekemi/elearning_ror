class SessionsController < ApplicationController

    def home
    end
    def new
        @student = Student.new
        render :login
       
    end

    def create
        @student = Student.find_by(username: params[:student][:username])
        if @student && @student.authenticate(params[:student][:password])
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            #render :login
            flash[:message] = "Incorrect login redentials"
            redirect_to '/login'
        end



    end

    def destroy
        session.clear
        redirect_to root_path

    end
end