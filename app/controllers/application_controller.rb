class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  private

  def initialize_session
    session[:shopping_cart] ||= {}
  end

  def cart
    manga_ids = session[:shopping_cart].keys
    Manga.where(id: manga_ids)
  end
end
