class HomeController < ApplicationController
  def index
    manga_controller = MangaController.new
    manga_controller.index
    @mangas = manga_controller.instance_variable_get(:@mangas)
  end
end
