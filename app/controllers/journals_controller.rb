class JournalsController < ApplicationController
  before_action :redirect_not_admin, only: [:index, :edit, :update,
                                            :new, :create, :destroy]

  def index
    @journals = Journal.all
  end

  def show
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:id])
    if @journal.update_attributes(journal_attributes)
      flash[:success] = "Дневник обновлен"
      redirect_to journals_path
    else
      flash[:danger] = "Произошла ошибка при редактировании дневника"
      redirect_to new_journal_path
    end
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
    @journal = Journal.find(params[:id])
    @journal.destroy

    flash[:success] = "Дневник успешно удален"
    redirect_to journals_path
  end

  private
    def journal_attributes
      params.require(:journal).permit(:name, :description)
    end
end
