class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(id: params[:id])
    render plain: "#{status.to_s.titleize} :(", status: :not_found if @course.blank?
  end
end