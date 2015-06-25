module ApplicationHelper
  def get_full_title(page_title)
    if page_title.empty?
      return "Сева Жидков"
    else
      return page_title + " – Сева Жидков"
    end
  end
end
