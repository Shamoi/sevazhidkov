require 'spec_helper'

describe "Home page" do
  it "should return 'OK' status code" do
    visit '/'
    page.status_code.should == 200
  end

  it "should have right title" do
    visit '/'
    expect(page).to have_title('Сева Жидков')
  end
end
