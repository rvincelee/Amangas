class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  before_action :initialize_session
  helper_method :cart, :current_user_has_address?

  private

  def initialize_session
    session[:shopping_cart] ||= {}
  end

  def cart
    manga_ids = session[:shopping_cart].keys
    Manga.where(id: manga_ids)
  end
end
