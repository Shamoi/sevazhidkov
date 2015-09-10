class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :short_description, presence: true
end
