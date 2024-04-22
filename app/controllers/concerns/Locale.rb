module Locale
  extend ActiveSupport::Concern

  included do
    before_action :current_locale
  end

  def set_locale(locale)
    session[:locale] = locale
  end

  def current_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

end