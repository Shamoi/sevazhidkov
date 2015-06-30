class ArticlesController < ApplicationController
  before_action :redirect_not_admin, only: [:new, :create, :edit,
                                            :update, :destroy]

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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.new(article_attributes)
    if @article.save
      flash[:success] = "Публикация отредактирована"
      redirect_to @article
    else
      flash[:danger] = "Произошла ошибка во время редактирования. Попробуйте еще раз."
      redirect_to new_article_path
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash[:success] = "Публикация удалена"
    redirect_to articles_path
  end

  def index
    @articles = Article.order(:updated_at).reverse
  end

  private
    def article_attributes
      params.require(:article).permit(:title, :text, :description)
    end
end
