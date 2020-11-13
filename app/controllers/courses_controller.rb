class CoursesController < ApplicationController
before_action :redirect_if_not_logged_in

    def index
        if params[:q]
            @courses = Course.search(params[:q])
        else
            @courses = Course.beta.all
        end

    end
    def new
        @course = Course.new
    end

    def create 
        #binding.byebug
        @course = current_student.courses.build(course_params)
    if @course.save
        #redirect them to show 
        redirect_to course_path(@course) #"/course/:id"
    else
        flash[:error] ="You must fill up everything"
        render :new
    end
end
    def show
        @course = Course.find_by_id(params[:id])  
    end


    def edit
        @course = Course.find(params[:id])
    end

    def update
        @course = current_student.courses.find(params[:id])
     
        if @course.update(course_params)
            redirect_to course_path(@course)
        else
            @error = @course.errors.full_messages
            render :edit
        end
    end
    private 

    def course_params
        params.require(:course).permit(:topic,:roomNumber,:prosesorName,:location,
        :startDate,:endDate,:beginningDate,:endingDate,:requirement)

    end
end
    
    
