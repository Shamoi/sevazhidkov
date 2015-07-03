class AddShortNameToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :short_name, :string
  end
end
