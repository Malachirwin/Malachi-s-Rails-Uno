require 'rails_helper'

RSpec.describe GameController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #game_home" do
    it "returns http success" do
      get :game_home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #game_over" do
    it "returns http success" do
      get :game_over
      expect(response).to have_http_status(:success)
    end
  end

end
