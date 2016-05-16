require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #upvote" do
    it "returns http success" do
      get :upvote
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #downvote" do
    it "returns http success" do
      get :downvote
      expect(response).to have_http_status(:success)
    end
  end

end
