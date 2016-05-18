require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #reply" do
    it "returns http success" do
      get :reply
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

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
