class Service < ActiveRecord::Base
   validates :name, :description, :link, :admin_link,
             presence: true
end
