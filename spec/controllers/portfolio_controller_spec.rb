require 'spec_helper'

describe PortfolioController do

  describe "index project" do
    it "returns http success" do
      get 'index'
      response.status.should == 200
    end
  end

  describe "show project" do
    it "returns http success" do
      get 'show', id: 1 # Need to run 'rake db:seed RAILS_ENV=test' before
                        # running this test
      response.status.should == 200
    end
  end
end
