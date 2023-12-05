class AddressesController < ApplicationController
  before_action :load_provinces, only: %i[new create]

  def new; end

  def index
    return unless current_user.present?

    @addresses = Address.where(user_id: current_user.id)
  end

  def create
    address = Address.create(
      street:      params[:street],
      city:        params[:city],
      postal_code: params[:postal_code],
      province_id: params[:province_id],
      user_id:     current_user.present? ? current_user.id : nil
    )

    address.save
    session["guest_address"] = address unless current_user.present?

    redirect_to checkout_index_path
  end

  private

  def load_provinces
    @provinces = Province.all # Assuming you have a Province model and want all provinces
  end
end
