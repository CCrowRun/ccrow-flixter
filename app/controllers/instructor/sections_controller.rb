class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:create]
  before_action :require_authorized_for_current_section, only: [:update]

  def create
    @section = current_course.sections.create(section_params)
    if @section.valid?
      redirect_to instructor_course_path(current_course)
    else
      render plain: "Invalid parameters", status: :unprocessable_entity
    end
  end

  def update
    current_section.update_attributes(section_params)
    render plain: 'Updated!'
  end

  private
  def require_authorized_for_current_section
    if current_section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:id])
  end

  def require_authorized_for_current_course
    if current_course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_course
  def current_course
    if params[:course_id]
      @current_course ||= Course.find_by(id: params[:course_id])
    else
      current_section.course
    end
  end

  def section_params
    params.require(:section).permit(:title, :row_order_position)
  end
end