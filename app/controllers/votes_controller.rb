class VotesController < ApplicationController

  def index

  end

  def create
    if params.key?(:post_id)
      votable = Post.find_by_id(params[:post_id])
    elsif params?key?(:user_id)
      votable = User.find_by_id(params[:user_id])
    else
      return render plain: "invalid input"
    end


    my_vote = votable.votes.find_by_user_id(current_user.id)

    if my_vote.nil?
      current_user.ratings << votable.votes.create({value:vote_params})
    else
      if(params[:vote][:value].to_i != my_vote.value)
        my_vote.value=params[:vote][:value]
        my_vote.save
      end
    end

    # respond_to do |format|
    #   format.json { render json:{result:true,votes:votable.votes}}
    # end

    redirect_to root_path
  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end
end