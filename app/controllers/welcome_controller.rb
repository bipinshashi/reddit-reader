class WelcomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
  	response = HTTParty.get('https://www.reddit.com/hot.json?limit=20', headers: {"User-Agent" => 'bpn_sasi_reddit_reader'})
  	@posts = [] 
  	@current_user_fav_post_ids = current_user.favorited_posts.collect(&:reddit_id) if current_user  		
  	response['data']['children'].each do |c| 
  		img_url = (c['data']['thumbnail'] =~ URI::regexp) ? c['data']['thumbnail'] : nil
  		@posts << Post.new(:reddit_id => c['data']['id'], :title => c['data']['title'], :web_url => c['data']['url'], :img_url => img_url, :num_comments => c['data']['num_comments'])
  	end
  end

  def favs
  	@current_user_fav_post_ids = current_user.favorited_posts.collect(&:reddit_id)
  	@posts = current_user.favorited_posts
  end

  def favorite_action
  	post = params[:post]
  	Post.create(:reddit_id => post[:reddit_id], :title => post[:title], :web_url => post[:web_url], :img_url => post[:img_url], :user_id => current_user.id )
  	render :json => {status: 200}
  end

  def unfavorite_action
  	post = Post.where(:user_id => current_user.id, :reddit_id => params[:post][:reddit_id]).last
  	post.destroy
  	render :json => {status: 200}
  end

end
