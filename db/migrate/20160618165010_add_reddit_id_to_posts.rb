class AddRedditIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :reddit_id, :string
  end
end
