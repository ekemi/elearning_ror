class ApplicationController < ActionController::Base
helper_method :current_student , :logged_in?
    private

    def current_student
        @student ||= Student.find_by_id(session[:student_id]) if session[:student_id]
end

def logged_in?
    !!session[:student_id]
end

def redirect_if_not_logged_in
    redirect_to '/'if !logged_in?
end
end
