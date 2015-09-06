require 'spec_helper'

describe "layouts/_navigation.html.haml" do
  it "should have link to index page" do
    render
    expect(rendered).to have_link('Главная', '/')
  end

  it "should have link to contacts page" do
    render
    expect(rendered).to have_link('Контакты', '/contacts')
  end

  it "should have link to portfolio page" do
    render
    expect(rendered).to have_link('Портфолио', '/portfolio')
  end
end
