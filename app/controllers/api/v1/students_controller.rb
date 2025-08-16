class Api::V1::StudentsController < ApplicationController
  before_action :authenticate_token!, only: [:destroy]

  def create
    student = Student.create!(student_params)

    token = Digest::SHA256.hexdigest("#{student.id}#{Rails.application.credentials.secret_key_base}")

    response.set_header('X-Auth-Token', token)

    render json: student, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def destroy
    student = Student.find(params[:user_id])
    student.destroy!
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Student not found' }, status: :bad_request
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :class_id, :school_id)
  end

  def authenticate_token!
    token = request.headers['Authorization']&.split(' ')&.last
    expected_token = Digest::SHA256.hexdigest("#{params[:user_id]}#{Rails.application.credentials.secret_key_base}")
  
    unless token == expected_token
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
