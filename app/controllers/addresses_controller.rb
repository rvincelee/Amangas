class AddressesController < ApplicationController
  before_action :load_provinces, only: %i[new create]

  def new; end

  def index
    return unless current_user.present?

    @addresses = Address.where(user_id: current_user.id)
  end

  def create
    def create
      if current_user.present?
        # User is logged in, create an address for the user
        address = current_user.addresses.create(
          street:      params[:street],
          city:        params[:city],
          postal_code: params[:postal_code],
          province_id: params[:province_id]
        )
      else
        # User is a guest, store address details in the session
        session["guest_address"] = {
          street:      params[:street],
          city:        params[:city],
          postal_code: params[:postal_code],
          province_id: params[:province_id]
        }
      end

      redirect_to checkout_index_path
    end
  end

  private

  def load_provinces
    @provinces = Province.all # Assuming you have a Province model and want all provinces
  end
end
