class AddMarkdownDescriptionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :markdown_description, :text
  end
end
