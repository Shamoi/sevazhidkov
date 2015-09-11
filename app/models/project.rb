class Project < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :short_description, presence: true, length: { maximum: 146 }

  # Rendered description in HTML
  validates :description, presence: true

  # Project description in markdown
  validates :markdown_description, presence: true

  protected
    def create_html_description_from_markdown
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                         autolink: true, tables: true)
      self.description = markdown.render(self.markdown_description)
    end
end
