class CheckoutController < ApplicationController
  before_action :load_addresses, :load_provinces, only: %i[index create]

  def index
    manga_ids = session[:shopping_cart].keys
    @items = Manga.where(id: manga_ids)
    prices = @items.map do |item|
      item.price * session[:shopping_cart][item.id.to_s]["quantity"].to_i
    end

    session["checkout_address"] =
      current_user.present? ? current_user.addresses[0] : session["guest_address"]

    @subtotal = prices.sum

    return unless current_user.addresses.present? || session["guest_address"].present?

    @province = Province.find(current_user.present? ? current_user.addresses[0].province_id : session["guest_address"]["province_id"])
    @pst = @province.PST.to_f
    @gst = @province.GST.to_f
    @hst = @province.HST.to_f
  end

  def create
    manga_ids = session[:shopping_cart].keys
    items = Manga.where(id: manga_ids)
    items_list = []

    redirect_to root_path if manga_ids.nil?

    items.each do |item|
      items_list << {
        price_data: {
          product_data: {
            name:        item.title,
            description: "Manga"
          },
          unit_amount:  (item.price * 100).to_i,
          currency:     "cad"
        },
        quantity:   session["shopping_cart"][item.id.to_s]["quantity"].to_i
      }
    end

    province = Province.find(session["checkout_address"]["province_id"])

    unless province.GST.nil?
      items_list << {
        price_data: {
          currency:     "cad",
          product_data: {
            name:        "GST",
            description: "Goods and Services Tax"
          },

          unit_amount:  (items_list.sum { |item|
                           item[:price_data][:unit_amount] * item[:quantity]
                         } * province.GST).to_i
        },
        quantity:   1
      }
    end

    unless province.PST.nil?
      items_list << {
        price_data: {
          currency:     "cad",
          product_data: {
            name:        "PST",
            description: "Provincial Sales Tax"
          },

          unit_amount:  (items_list.sum { |item|
                           item[:price_data][:unit_amount] * item[:quantity]
                         } * province.PST).to_i
        },
        quantity:   1
      }
    end

    unless province.HST.nil?
      items_list << {
        price_data: {
          currency:     "cad",
          product_data: {
            name:        "HST",
            description: "Harmonized Sales Tax"
          },

          unit_amount:  (items_list.sum { |item|
                           item[:price_data][:unit_amount] * item[:quantity]
                         } * province.HST).to_i
        },
        quantity:   1
      }

    end
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      mode:                 "payment",
      success_url:          checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url:           checkout_cancel_url,
      line_items:           items_list
    )

    redirect_to @session.url, status: :see_other, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel; end

  private

  def load_addresses
    return unless current_user.present?

    @addresses = Address.where(user_id: current_user.id)
  end

  def load_provinces
    @provinces = Province.all
  end
end
