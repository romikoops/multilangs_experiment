class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    I18n.locale = @user.locale
    redirect_to root_path(locale: I18n.locale)
  end
end