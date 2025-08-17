class Api::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_unprocessable_entity(exception)
    render json: {error: exception.message}, status: :unprocessable_entity
  end

  def render_not_found(exception)
    klass = exception.model.underscore
    id = exception.id
    message = I18n.t("activerecord.errors.#{klass}.not_found", id:)
    render json: {error: message}, status: :not_found
  end
end
