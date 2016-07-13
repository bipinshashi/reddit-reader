class Post < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :title, :web_url, :user_id, :reddit_id
end
