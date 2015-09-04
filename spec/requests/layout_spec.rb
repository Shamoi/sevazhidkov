require 'spec_helper'

describe "Layout" do
  describe "header" do
    it "should have owner's name" do
      # Home page have all layout
      visit '/'
      expect(page).to have_content('Сева Жидков')
    end

    it "should have tagline" do
      visit '/'
      expect(page).to have_content('Люблю программирование и себя')
    end
  end

  describe "footer" do
    it "should have copyright" do
      # Home page have all layout
      visit '/'
      expect(page).to have_content('© 2015. Сева Жидков.')
    end

    it "should have link to git repo" do
      # Home page have all layout
      visit '/'
      expect(page).to have_link('https://github.com/sevazhidkov/sevazhidkov')
    end
  end
end
