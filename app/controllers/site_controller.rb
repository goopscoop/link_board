class SiteController < ApplicationController


  def index
    @posts = Post.all
    @votes = Vote.all
    @vote = Vote.new
    # render :json => @votes
  end

end