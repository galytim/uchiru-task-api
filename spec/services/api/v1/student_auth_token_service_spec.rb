require "rails_helper"

RSpec.describe Api::V1::StudentAuthTokenService do
  let(:student) { create(:student) }
  let(:service) { described_class.new(student:) }

  describe "#auth_token" do
    it "generates sha256 token based on student id and secret_key_base" do
      expected = Digest::SHA256.hexdigest("#{student.id}#{Rails.application.credentials.secret_key_base}")
      expect(service.auth_token).to eq(expected)
    end
  end

  describe "#authorize!" do
    it "returns true if token is valid" do
      token = service.auth_token
      authorized = described_class.new(student:, token:).authorize!
      expect(authorized).to be true
    end

    it "returns false if token is invalid" do
      authorized = described_class.new(student:, token: "wrong").authorize!
      expect(authorized).to be false
    end
  end
end
