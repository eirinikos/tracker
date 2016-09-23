require 'rails_helper'

RSpec.describe V1::ProjectsController, type: :controller do
  describe "invalid Project id" do
    it "returns the correct error" do
      get :show, id: 1
      expect(response.status).to eq(404)
      expect(response.content_type).to eq("application/json")
      expect(response.body).to eq("{\"errors\":[\"Project not found\"]}")
    end
  end
end
