module ApplicationHelper
  def get_full_title(page_title='')
    base_title = 'Сева Жидков'
    if page_title.empty?
      base_title
    else
      "#{page_title} — #{base_title}"
    end
  end

  def get_date_of(datetime)
    # If datetime is not nil, we convert it to needed time zone and format it
    # If datetime is nil, we returned empty string.
    if datetime
      datetime.in_time_zone.strftime("%d.%m.%Y")
    else
      ""
    end
  end
end
