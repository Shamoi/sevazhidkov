require 'spec_helper'

describe "Home pages" do
  describe "Home page" do
    it "should have Seva's name" do
      visit '/'
      expect(page).to have_content('Сева Жидков')
    end
  end
end
