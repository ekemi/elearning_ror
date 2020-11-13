class ReviewsController < ApplicationController

before_action :redirect_if_not_logged_in

def index 
    if params[:course_id] && @course = Course.find_by_id(params[:course_id])
        @reviews = @course.reviews
    elsif current_student
        @reviews = current_student.reviews.all
    else
        @error = "Course does not exist" if params[:course_id]
        @reviews = Review.all
    end
end

def new
    if params[:course_id] && @course = Course.find_by_id(params[:course_id])
        @review = @course.reviews.new
    else
        @error = "Course does not exist" if params[:course_id]
        @review = Review.new
    end
end

def create
    @course = Course.find(params[:review][:course_id])
    @review = current_student.reviews.new(review_params)
        
        if @review.save
            redirect_to course_review_path(@course, @review)
        else
            @error = @review.errors.full_messages
            render :new
        end
end
def update 
    @review = current_student.reviews.find(params[:id])
     
    if @review.update(review_params)
        redirect_to review_path(@review)
    else
        @error = @review.errors.full_messages
        render :edit
    end
end

def show
    @review = Review.find(params[:id])
end
def edit
    @review = Review.find(params[:id])
end
def destroy
    @review= current_student.reviews.find(params[:id])
    if @review.destroy
        flash[:success] = "Your review was successfully deleted."
        redirect_to courses_path
    else
        @error = @review.errors.full_messages
        render :edit
    end
end
private

def review_params
    params.require(:review).permit(:rating,:comments, :course_id, :student_id)
end
end
