class LessonsController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :require_authorized_for_current_lesson
  def show
  end

  private

  def require_authorized_for_current_lesson
    @course = current_lesson.section.course
    if !(current_user.enrolled_in?(@course))
      redirect_to course_path(@course), alert: 'You are not enrolled!'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
