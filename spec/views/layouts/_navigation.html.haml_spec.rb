require 'spec_helper'

describe "layouts/_navigation.html.haml" do
  it "should have link for index page" do
    render
    expect(rendered).to have_link('Главная', '/')
  end

  it "should have link for contacts page" do
    render
    expect(rendered).to have_link('Контакты', '/contacts')
  end
end
