class OrdersController < ApplicationController
  before_action :validate_user
  def index
    @orders = Order.where(user_id: current_user.id)
    @order_details = @orders.each do |order|
      OrderDetail.where(order_id: order.id)
    end
  end

  def show; end

  private

  def validate_user
    redirect_to root_path unless user_signed_in?
  end
end
