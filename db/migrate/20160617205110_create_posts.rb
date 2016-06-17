class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :web_url
      t.string :img_url

      t.timestamps null: false
    end
  end
end
