class OrdersController < ApplicationController
  before_action :validate_user
  def index
    @orders = Order.where(user_id: current_user.id)
    @order_details = []
    @orders.each do |order|
      @order_details += OrderDetail.where(order_id: order.id)
    end
    @mangas = []
    @order_details.each do |detail|
      @mangas |= Manga.where(id: detail.manga_id)
    end
  end

  def show; end

  private

  def validate_user
    redirect_to root_path unless user_signed_in?
  end
end
