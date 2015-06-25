require 'spec_helper'

describe "Home pages" do
  describe "Home page" do
    it "should have Seva's name" do
      visit '/'
      expect(page).to have_content('Сева Жидков')
    end
  end

  describe "Contact page" do
    it "should have th content 'Контакты'" do
      visit '/contact'
      expect(page).to have_content('Контакты')
    end
  end
end
