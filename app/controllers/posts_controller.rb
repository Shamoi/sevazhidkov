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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def post_attributes
      params.require(:post).permit(:journal, :time, :text)
    end
end
