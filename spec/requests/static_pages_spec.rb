require 'spec_helper'

describe "Static pages" do
  describe "contact page" do
    it "should return 'OK' status code" do
      visit '/'
      page.status_code.should == 200
    end
  end
end
