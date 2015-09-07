require 'spec_helper'

describe PortfolioController do

  describe "index project" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "show project" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "create project" do
    it "returns http success" do
      post 'create'
      response.should be_success
    end
  end

  describe "new project" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "edit project" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "update project" do
    it "returns http success" do
      put 'update'
      response.should be_success
    end
  end

  describe "destroy project" do
    it "returns http success" do
      delete 'destroy'
      response.should be_success
    end
  end

end
