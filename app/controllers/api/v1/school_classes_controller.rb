class Api::V1::SchoolClassesController < Api::BaseController
  def index
    school = School.includes(:school_classes).find(params[:school_id])
    render json:  { 
      data: Panko::ArraySerializer.new(
        school.school_classes,
        each_serializer: SchoolClassSerializer
      ).to_a
    }, status: :ok
  end
end