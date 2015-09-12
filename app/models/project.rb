class Project < ActiveRecord::Base
  # Automatic Markdown render of project description
  before_validation :create_html_description_from_markdown, on: [ :create,
                                                                  :update ]

  # Project name like 'Facebook', 'Twitter', 'Seva Zhidkov site'
  validates :name, presence: true, length: { maximum: 50 }

  # Short description of project, visible in index projects
  validates :short_description, presence: true, length: { maximum: 146 }

  # Rendered description in HTML, visible in show action
  validates :description, presence: true

  # Project description in markdown
  validates :markdown_description, presence: true

  protected
    def create_html_description_from_markdown
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                         autolink: true, tables: true)
      self.description = markdown.render(self.markdown_description).chomp
    end
end
