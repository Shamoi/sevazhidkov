require 'spec_helper'

describe "static_pages/contact.html.haml" do
  it 'should have links to my social networks' do
    render

    social_networks_urls = ['https://vk.com/shamoiseva',
                            'https://twitter.com/shamoiseva',
                            'https://instagram.com/lifeofshamoi/']
    social_networks_urls.each do |network_url|
      except(rendered).to have_link(href: network_url)
    end
  end
end
