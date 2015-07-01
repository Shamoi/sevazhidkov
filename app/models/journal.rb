class Journal < ActiveRecord::Base
  validates :name, :description,
            presence: true
end
