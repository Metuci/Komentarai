class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      if params[:alias].present?
        @article = Article.find_by(alias: params[:alias])
      else
        @article = Article.find(params[:id])
      end
    end

end
