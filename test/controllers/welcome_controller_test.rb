require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
	include Devise::TestHelpers
  test "should get index" do 
    get :index
    assert_response :success
  end

  test "should favorite post" do
  	assert_difference('Post.count') do
  		sign_in users(:one)
    	post "favorite_action", { post: { web_url: 'http://google.com', title: 'Hello Rails', reddit_id: 1, user_id: 1 } }
  	end
  end

  test "should unfavorite post" do
  	assert_difference('Post.count', -1) do
  		sign_in users(:one)
    	post "unfavorite_action", { post: { reddit_id: 1 } }
  	end
  end

end
