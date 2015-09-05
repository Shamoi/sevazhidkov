module ApplicationHelper
  def get_full_title(page_name=nil)
    basic_title = 'Сева Жидков'
    if page_name
      return page_name + ' — ' + basic_title
    else
      return basic_title
    end
  end
end
