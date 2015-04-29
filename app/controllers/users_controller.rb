class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    # redirect_to root_path
    # render :json => @user

    if @user['id'].nil?
      flash[:danger] = "Incorrect email format"
      render :new
    else flash[:success] = "Sign up successful"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:name)
  end



end