class AddUserIndexToPost < ActiveRecord::Migration
  def change
  	add_index :posts, :user_id, :name => 'post_user_id_ix'
  end
end
