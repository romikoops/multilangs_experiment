class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user
  helper_method :current_user

  def current_user
    @user ||= User.find_or_create_by_session_id(session[:session_id])
  end

  # private
  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  #   Rails.application.routes.default_url_options[:locale] = I18n.locale
  # end
  #
  # def extract_locale_from_accept_language_header
  #   request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  # end
end
