require 'spec_helper'

describe "layouts/_header.html.haml" do
  it "should have owner's name" do
    render
    expect(rendered).to have_content('Сева Жидков')
  end
end
