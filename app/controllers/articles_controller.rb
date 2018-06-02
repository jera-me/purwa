class ArticlesController < ApplicationController

  def index
    @articles = Article.order(created_at: :desc)
  end

  def new
    @articles = Article.new
    @series = Series.all
  end

  def create
    @articles = Article.new(resource_params)
    @articles.save
    redirect_to root_path
  end

  def resource_params
    params.require(:article).permit(:title, :content, :description, :keywords, :tags, :image, :series_id)
  end

end
