class WelcomeController < ApplicationController
  
  def index
  	response = HTTParty.get('https://www.reddit.com/hot.json?limit=20', headers: {"User-Agent" => 'bpn_sasi_reddit_reader'})
  	@posts = [] 
  	response['data']['children'].each do |c| 
  		img_url = (c['data']['thumbnail'] =~ URI::regexp) ? c['data']['thumbnail'] : nil
  		@posts << Post.new(:title => c['data']['title'], :web_url => c['data']['url'], :img_url => img_url)
  	end
  end

  def favs
  	redirect_to root_path if current_user == nil
  end

end
