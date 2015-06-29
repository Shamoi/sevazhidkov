class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_attributes)
    if @article.save
      flash[:success] = "Публикация создана"
      redirect_to @article
    else
      flash[:danger] = "Произошла ошибка во время публикации. Попробуйте еще раз."
      redirect_to new_article_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all.order_by(:updated_at)
  end

  private
    def article_attributes
      params.require(:article).permit(:title, :text)
    end
end
