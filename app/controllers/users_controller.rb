class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to root_path
  end
end