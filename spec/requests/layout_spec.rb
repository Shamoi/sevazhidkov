require 'spec_helper'

describe "Layout" do
  describe "footer" do
    it "should have copyright" do
      # Home page have all layout
      visit '/'
      expect(page).to have_content('© 2015. Сева Жидков.')
    end

    it "should have link to git repo" do
      # Home page have all layout
      visit '/'
      expect(page).to have_link('Github', href: 'https://github.com/sevazhidkov/sevazhidkov')
    end
  end
end
