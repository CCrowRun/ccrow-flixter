class CoursesController < ApplicationController
  before_action :load_course, only: [:show]
  before_action :not_found, only: [:show], if: -> { @course.blank? }
  
  def index
    @courses = Course.all
  end

  def show
  end

private
  def load_course
    @course = Course.find_by(id: params[:id])
  end
end