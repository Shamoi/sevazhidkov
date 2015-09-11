class Project < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :short_description, presence: true, length: { maximum: 146 }
  validates :description, presence: true
end
