class UsersController < ApplicationController
  def new
    @user = User.new
    @team = Team.find(1)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end

  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_digest,:team_id)
    end
end