class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson

  def show 
  end

private

  def require_authorized_for_current_lesson
      if current_lesson.section.course.user != current_user
      #if !current_user.enrollments.pluck(:course_id).include?(current_lesson.section.course.id)
      redirect_to course_path(current_lesson.section.course), alert: 'Enrollment Required'
    end
   end 

   helper_method :current_lesson
   def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
   end
end
