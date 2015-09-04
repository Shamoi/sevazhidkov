require 'spec_helper'

describe "Home page" do
  it "should return 'OK' status code" do
    visit '/'
    response.status.should be(200)
  end
end
