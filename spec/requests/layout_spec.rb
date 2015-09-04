require 'spec_helper'

describe "Layout" do
  describe "Header" do
    it "should have owner's name as heading" do
      # Home page have all layout
      visit '/'
      except(page).to have_content('<h1>Сева Жидков</h1>')
    end
  end
end
