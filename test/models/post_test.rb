require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "Post cannot be saved without critical attributes" do
	  post = Post.new(:web_url => "http://google.com", :user_id => 1, :reddit_id => 22)
	  assert_not post.save 
	  post = Post.new(:title => "hey", :user_id => 1, :reddit_id => 22)
	  assert_not post.save 
	  post = Post.new(:title => "hey", :web_url => "http://google.com", :reddit_id => 22)
	  assert_not post.save 
	  post = Post.new(:title => "hey", :web_url => "http://google.com", :user_id =>1)
		assert_not post.save
	end
	
	test "Post can be saved with all critical attributes present" do
	  post = Post.new(:title => "hey", :web_url => "http://google.com", :user_id => 1, :reddit_id => 22)
	  assert post.save 
	end
end
