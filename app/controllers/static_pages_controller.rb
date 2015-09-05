class StaticPagesController < ApplicationController
  def contact
    # Todo: refactor it, move data to model
    @social_networks = {
      'Twitter' => 'https://twitter.com/shamoiseva',
      'VK' => 'https://vk.com/shamoiseva',
      'Instagram' => 'https://instagram.com/lifeofshamoi/'
    }
  end
end
