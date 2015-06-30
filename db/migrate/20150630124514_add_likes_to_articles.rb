class AddLikesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :likes, :number
  end
end
