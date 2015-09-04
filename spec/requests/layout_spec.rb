require 'spec_helper'

describe "Layout" do
  describe "header" do
    it "should have owner's name" do
      # Home page have all layout
      visit '/'
      expect(page).to have_content('Сева Жидков')
    end
  end
end
