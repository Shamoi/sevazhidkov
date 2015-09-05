require 'spec_helper'

describe "layouts/application.html.haml" do
  it "should have header" do
    render
    expect(rendered).to have_css("header") # True if there is a anchor tag with text hello
  end

  it "should have navigation" do
    render
    expect(rendered).to have_css("aside") # True if there is a anchor tag with text hello
  end

  it "should have footer" do
    render
    expect(rendered).to have_css("footer") # True if there is a anchor tag with text hello
  end

  it 'should have basic title if page name is not provided' do
    render
    expect(rendered).to have_title('Сева Жидков')
  end
end
