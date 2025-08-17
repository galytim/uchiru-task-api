class Api::V1::StudentAuthTokenService
  def initialize(student:, token: nil)
    @student = student
    @token = token
  end

  def authorize! = auth_token == @token

  def auth_token = Digest::SHA256.hexdigest("#{@student.id}#{Rails.application.credentials.secret_key_base}")
end
