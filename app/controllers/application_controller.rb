class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale, :new_user, :playing_movies
  before_action :configure_devise_permitted_params, if: :devise_controller?

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def new_user
    @user = User.new unless signed_in?
  end

  def playing_movies
    @movies = Movie.joins(:shows).merge(Show.today).playing.latest_order.uniq
  end

  def configure_devise_permitted_params
    devise_parameter_sanitizer.permit :sign_up,
      keys: %i(username email password password_confirmation first_name
               last_name birthday gender address)
  end
end
