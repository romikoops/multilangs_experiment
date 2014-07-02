class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user, :set_locale
  helper_method :current_user

  def current_user
    @user ||= User.find_or_create_by_session_id(session[:session_id] || request.session_options[:id])
  end

  private
  def set_locale
    I18n.locale = locale_from_params ||
                  locale_from_user ||
                  locale_from_domain ||
                  locale_from_http ||
                  i18n.default_locale
    Rails.application.routes.default_url_options[:locale] = I18n.locale
  end

  def locale_from_params
    params[:locale]
  end

  def locale_from_user
    current_user.locale
  end

  def locale_from_domain
    nil #TODO only if we will have different domains
  end

  def locale_from_http
    http_accept_language.compatible_language_from(I18n.available_locales)
  end
end
