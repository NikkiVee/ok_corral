class Api::UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      render :index
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def index
    @users = User.all
    render :index
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :zip,
      :age, :gender, :orientation)
  end

end

## TODO:
##   Implement edit functionality