class PostsController < ApplicationController
  before_action :redirect_not_admin, only: [:new, :create, :edit,
                                            :update, :destroy   ]

  def show
  end

  def new
    @journals = Journal.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_attributes)
    @post.update_attributes(journal: Journal.find(params['post']['journal']))

    if @post.save
      flash[:success] = "Пост создан"
      redirect_to root_path
    else
      flash[:danger] = "Произошла ошибка при создании поста"
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def post_attributes
      params.require(:post).permit(:time, :text, :image)
    end
end
