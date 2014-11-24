class HashtagsController < ApplicationController
	def show
		#@hashtag = Hashtag.find(params[:id])
		@hashtag = Hashtag.where(h: params[:hash_tag_id]).first

		@tweets = Tweet.all
		if @hashtag
			@filtered_tweets = @tweets.select {|t| t.extract_hash_tags.include?(@hashtag.h)}
		else
			@filtered_tweets = Array.new
			flash.now[:notice] = "There are no tweets with #{params[:hash_tag_id]}"
		end

	end
end
