class CartController < ApplicationController
  def create
    id = params[:id]
    quantity = params[:quantity].to_i || 1

    if session[:shopping_cart].key?(id)
      session[:shopping_cart][id]["quantity"] += quantity
    else
      session[:shopping_cart][id] = { "quantity" => quantity }
    end
    manga = Manga.find(id)
    flash[:notice] = "#{manga.title} added to the cart."
    redirect_to mangas_path
  end

  def destroy
    id = params[:id].to_s
    session[:shopping_cart].delete(id)
    redirect_to cart_index_path
  end

  def increment
    id = params[:id]

    session[:shopping_cart].key?(id) && session[:shopping_cart][id]["quantity"] += 1

    redirect_to cart_index_path
  end

  def decrement
    id = params[:id]

    session[:shopping_cart].key?(id) && session[:shopping_cart][id]["quantity"] -= 1

    redirect_to cart_index_path
  end

  def index
    manga_ids = session[:shopping_cart].keys
    @items = Manga.where(id: manga_ids)
    prices = @items.map do |item|
      item.price * session[:shopping_cart][item.id.to_s]["quantity"].to_i
    end
    @subtotal = prices.sum
  end
end
