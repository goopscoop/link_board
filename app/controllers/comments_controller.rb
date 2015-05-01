class CommentsController < ApplicationController

  def index
    @post = Post.find_by_id(params[:post_id])
    @user = User.find_by_id(@post.user_id)
    @users = User.all
    @comments = @post.comments
    @comment = @comments.new
    # render json: @comments
  end

  def show
  end

  def create
    current_user.comments.create({message:params[:comment][:message],post_id:params[:post_id]})
    render json: params
    # redirect_to posts_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

end