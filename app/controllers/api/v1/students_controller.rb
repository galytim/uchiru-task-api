class Api::V1::StudentsController < Api::BaseController
  before_action :set_student!, only: :destroy
  before_action :authenticate_student!, only: :destroy


  def create
    student = Student.create!(student_params)
    token = Api::V1::StudentAuthTokenService.new(student:).auth_token
    response.set_header("X-Auth-Token", token)
    render json: { data: student }, status: :created
  end

  def destroy
    @student.destroy
    head :no_content
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :class_id, :school_id)
  end

  def set_student!
    @student = Student.find_by(id: params[:user_id])
    render json: { error: "Некорректный id студента" }, status: :bad_request unless @student
  end

  def authenticate_student!
    token = request.headers["Authorization"].to_s.delete_prefix("Bearer ")
    authorized = Api::V1::StudentAuthTokenService.new(student: @student, token:).authorize!
    render json: { error: "Unauthorized" }, status: :unauthorized unless authorized
  end
end
