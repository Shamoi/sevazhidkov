require 'spec_helper'

describe "Home page" do
  it "should return 'OK' status code" do
    visit '/'
    page.status_code.should == 200
  end
end
