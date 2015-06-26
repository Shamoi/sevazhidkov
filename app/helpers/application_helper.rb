module ApplicationHelper
  def get_full_title(page_title)
    if page_title.empty?
      return "Сева Жидков"
    else
      return page_title + " – Сева Жидков"
    end
  end

  def redirect_not_admin
    if !admin?
      flash[:danger] = "Необходимо авторизоваться, чтобы использовать админку"
      redirect_to login_path
    end
  end
end
