class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to root_path
  end

  def update
    @post = Post.find_by_id(params[:id]).update(post_params)
    # current_user.posts.update(params[:id], post_params)
    redirect_to root_path
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def destroy
    @post = Post.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:link)
  end


end