require 'rails_helper'

RSpec.describe PatientsController, type: :controller do

  let(:secret) {
    "rhsoftware_challenge_testing"
  }
  let(:valid_token) {
    JwtHandler.encode(secret)
  }

  before(:each) do
  controller.request.env['HTTP_AUTHORIZATION'] = "Bearer #{valid_token}"
end

  describe "POST #imc" do
    it "returns a success response" do
      post :imc, params: {}
      expect(response).to be_successful
    end
  end
end
