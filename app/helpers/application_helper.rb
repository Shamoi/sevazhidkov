module ApplicationHelper
  def get_full_title(page_title)
    base_title = 'Сева Жидков'
    if page_title.empty?
      base_title
    else
      "#{page_title} — #{base_title}"
    end
  end
end
