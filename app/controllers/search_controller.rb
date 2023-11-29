class SearchController < ApplicationController
  def index
    @results = Manga.all

    if params[:keyword].present? || params[:genre_id].present?
      @keyword = params[:keyword]
      keyword_condition = "%#{params[:keyword]}%"
      @results = @results.where("title LIKE ? OR description LIKE ?", keyword_condition,
                                keyword_condition)

      return unless params[:genre_id].present?

      @genre_keyword = Genre.find(params[:genre_id])
      @results = @results.joins(:genres).where("genres.id = ?", params[:genre_id])

    else
      redirect_to mangas_path

    end
  end
end
