require 'spec_helper'

describe "static_pages/contact.html.haml" do
  it 'should have links to my social networks' do
    social_networks = {
      'Twitter' => 'https://twitter.com/shamoiseva',
      'VK' => 'https://vk.com/shamoiseva',
      'Instagram' => 'https://instagram.com/lifeofshamoi/'
    }

    assign(:social_networks, social_networks)

    render

    social_networks.each do |name, url|
      expect(rendered).to have_link(name, href: url)
    end
  end
end
