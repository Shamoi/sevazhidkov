require 'spec_helper'

describe "Home pages" do
  describe "Home page" do
    it "should have Seva's name" do
      visit '/'
      expect(page).to have_content('Сева Жидков')
    end

    it "should have the title 'Обо мне – Сева Жидков'" do
      visit '/'
      expect(page).to have_title("Обо мне – Сева Жидков")
    end
  end

  describe "Contact page" do
    it "should have the content 'Контакты'" do
      visit '/contact'
      expect(page).to have_content('Контакты')
    end

    it "should have the title 'Связаться со мной – Сева Жидков'" do
      visit '/contact'
      expect(page).to have_title("Связаться со мной – Сева Жидков")
    end
  end
end
