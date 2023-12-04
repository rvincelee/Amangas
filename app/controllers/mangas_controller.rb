class MangasController < ApplicationController
  def index
    @mangas = Manga.all

    puts "Received sort parameter: #{params[:sort]}"

    # Sorting functionality
    @mangas = case params[:sort_by]
              when 'score'
                @mangas.order(score: :desc)
              when 'title'
                @mangas.order(title: :asc)
              when 'price_asc'
                @mangas.order(price: :asc)
              when 'price_desc'
                @mangas.order(price: :desc)
              else
                @mangas.order(score: :desc)
              end
  end

  def show
    @manga = Manga.find(params[:id])
  end
end
