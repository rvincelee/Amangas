class SearchController < ApplicationController
  def index
    @results = Manga.page(params[:page])

    if params[:keyword].present? || params[:genre_id].present?
      @keyword = params[:keyword]
      keyword_condition = "%#{params[:keyword]}%"
      @results = @results.where("title LIKE ? OR description LIKE ?", keyword_condition,
                                keyword_condition)
      @results_length = @results.length
      return unless params[:genre_id].present?

      @genre_keyword = Genre.find(params[:genre_id])
      @results = @results.joins(:genres).where("genres.id = ?", params[:genre_id])
      @results_length = @results.length
    else
      redirect_to mangas_path

    end
  end
end
