class UsersController < ApplicationController
before_action :set_user, only: [:show, :follow]

  def index
    @users = User.all
  end


  def show
  end

  def follow
    # logged in user follows user from id
    current_user.events.create(action: "followed", eventable: @user)
    redirect_to users_path, notice: "you followed #{@user.name.full}"
  end


private

def set_user
  @user = User.find(params[:id])
end

end
