class HomeController < ApplicationController
  def index
    session["guest_address"] = nil
    session["checkout_address"] = nil
    session["order"] = nil
    session["order_details"] = nil
  end
end
