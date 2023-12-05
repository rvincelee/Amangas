class CheckoutController < ApplicationController
  before_action :load_addresses, :load_provinces, only: %i[index create]

  def index
    manga_ids = session[:shopping_cart].keys
    @items = Manga.where(id: manga_ids)
    prices = @items.map do |item|
      item.price * session[:shopping_cart][item.id.to_s]["quantity"].to_i
    end

    @subtotal = prices.sum

    return unless current_user.present? || session["guest_address"].present?

    @province = Province.find(current_user.present? ? current_user.addresses[0].province_id : session["guest_address"]["province_id"])
    @pst = @province.PST.to_f
    @gst = @province.GST.to_f
    @hst = @province.HST.to_f
  end

  def create; end

  private

  def load_addresses
    return unless current_user.present?

    @addresses = Address.where(user_id: current_user.id)
  end

  def load_provinces
    @provinces = Province.all
  end
end
