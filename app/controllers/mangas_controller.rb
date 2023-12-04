class MangasController < ApplicationController
  def index
    @mangas = Manga.page(params[:page])
  end

  def show
    @manga = Manga.find(params[:id])
  end
end
