class AddBuiltAtToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :built_at, :datetime
  end
end
