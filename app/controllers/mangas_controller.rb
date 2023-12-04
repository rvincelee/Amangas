class MangasController < ApplicationController
  def index
    @mangas = Manga.page(params[:page])

    puts "Received sort parameter: #{params[:sort]}"

    # Sorting functionality
    if params[:sort_by] == "none"
      # "do nothing"
    else
      @mangas = case params[:sort_by]
                when "score"
                  @mangas.order(score: :desc)
                when "title"
                  @mangas.order(title: :asc)
                when "price_asc"
                  @mangas.order(price: :asc)
                when "price_desc"
                  @mangas.order(price: :desc)
                when "recently_updated"
                  # Change to 3 days after a few days
                  @mangas.where("updated_at >= ?", 1.day.ago)
                         .where.not("created_at >= ?", 1.day.ago)
                         .order(updated_at: :desc)
                when "new_products"
                  @mangas.where("created_at >= ?", 1.day.ago).order(created_at: :desc)
                else
                  @mangas.order(:created_at) # Default sorting, e.g., by creation time
                end
    end
  end

  def show
    @manga = Manga.find(params[:id])
  end
end
