class HomeController < ApplicationController
  def index
    session["guest_address"] = nil
    session["checkout_address"] = nil
    session["order"] = nil
    session["order_details"] = nil

    @mangas = Manga.all

    @featured = @mangas.order(price: :asc).limit(5)

    @best_sellers = @mangas.where("score > ?", 9).limit(5)

    @completed = @mangas.where(status: "Finished").limit(5)
  end
end
