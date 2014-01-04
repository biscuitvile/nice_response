require 'spec_helper'

describe PetsController, type: :controller do

  describe "index" do
    before do
      Pet.create name: 'Buddy'; Pet.create name: 'Pip'
      get :index, format: :json
    end

    it "is successful" do
      response.code.should eq '200'
    end

    it "returns an array of pets as json" do
      body = JSON.parse response.body
      body.first['name'].should eq 'Buddy'
      body.last['name'].should eq 'Pip'
    end
  end

  describe "show" do
    before do
      Pet.create name: 'Lucky'
      get :show, id: 1, format: :json
    end

    it "is successful" do
      response.code.should eq '200'
    end

    it "returns a pet found by id as json" do
      body = JSON.parse response.body
      body['name'].should eq 'Lucky'
    end
  end

  describe "create" do
    before { post :create, format: :json, pet: { name: 'Boss' } }

    it "is successful" do
      response.code.should eq '201'
    end

    it "returns a created pet as json" do
      body = JSON.parse response.body
      body['name'].should eq 'Boss'
    end
  end

  describe "update" do
    before do
      Pet.create name: 'Smokey'
      put :update, format: :json, id: 1, pet: { name: 'Garfield' }
    end

    it "is successful" do
      response.code.should eq '204'
    end
  end

  describe "destroy" do
    before do
      Pet.create name: 'Smokey'
      delete :destroy, format: :json, id: 1
    end

    it "is successful" do
      response.code.should eq '204'
    end
  end

end
