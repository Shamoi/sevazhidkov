require 'spec_helper'

describe "layouts/_footer.html.haml" do
  it "should have copyright" do
    render
    expect(rendered).to have_content('© 2015. Сева Жидков.')
  end

  it "should have link to git repo" do
    render
    expect(rendered).to have_link('Github', href: 'https://github.com/sevazhidkov/sevazhidkov')
  end
end
