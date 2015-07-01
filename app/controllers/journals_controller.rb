class JournalsController < ApplicationController
  before_action :redirect_not_admin, only: [:index, :edit, :update,
                                            :new, :create, :destroy]

  def index
    @journals = Journal.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_attributes)

    if @journal.save
      flash[:success] = "Дневник создан"
      redirect_to @journal
    else
      flash[:danger] = "Произошла ошибка при создании дневника"
      redirect_to new_journal_path
    end
  end

  def destroy
  end

  private
    def journal_attributes
      params.require(:journal).permit(:name, :description)
    end
end
