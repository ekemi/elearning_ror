class CoursesController < ApplicationController
before_action :redirect_if_not_logged_in

    def index
        if params[:q]
            @coures = Course.search(params[:q])
        else
            @coures = Course.beta.all
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
    def show
        @course = Course.find_by_id(params[:id])  
    end
    end
    private 

    def course_params
        params.require(:course).permit(:topic,:roomNumber,:prosesorName,:location,
        :startDate,:endDate,:beginningDate,:endingDate,:requirement)

    end
end
    
    
