require 'spec_helper'

describe StaticPagesController do

  describe "GET 'contact'" do
    it "returns http success" do
      visit '/contact'
      page.status_code.should == 200
    end
  end

end
