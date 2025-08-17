class Api::V1::SchoolClassesController < Api::BaseController
  def students
    school = School.find(params[:school_id])
    school_class = school.school_classes.find(params[:class_id])
    students = school_class.students
    render json:  { data: students}, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'School or class not found' }, status: :not_found
  end
end