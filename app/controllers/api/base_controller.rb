class Api::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  private

  def render_unprocessable_entity(exception)
    render json: {error: exception.message}, status: :unprocessable_entity
  end
end
