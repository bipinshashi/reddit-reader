class AddNumCommentsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :num_comments, :integer
  end
end
