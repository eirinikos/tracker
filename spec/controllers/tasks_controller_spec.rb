require 'rails_helper'

RSpec.describe V1::TasksController, type: :controller do
  let(:task) { create(:task, id: 1) }

  describe "invalid Task id" do
    it "returns the correct error" do
      get :show, id: 2
      expect(response.status).to eq(404)
      expect(response.content_type).to eq("application/json")
      expect(response.body).to eq("{\"errors\":[\"Task not found\"]}")
    end
  end
end
