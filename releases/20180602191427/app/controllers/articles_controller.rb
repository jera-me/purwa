class ArticlesController < ApplicationController

  def index
    @articles = Article.order(created_at: :desc)
    response.headers["Expires"] = 1.year.from_now.httpdate
  end

  def show
    @articles = Article.find(params[:id])
    response.headers["Expires"] = 1.year.from_now.httpdate
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

  def edit
    @articles = Article.find(params[:id])
    @series = Series.all
  end

  def update
    @articles = Article.find(params[:id])
    @articles.update(resource_params)
    redirect_to root_path
  end



  def resource_params
    params.require(:article).permit(:title, :content, :description, :keywords, :tags, :image, :series_id)
  end

end
