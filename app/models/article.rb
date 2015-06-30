class Article < ActiveRecord::Base
  after_validation :create_html_from_markdown, on: [ :create, :update ]

  validates :title, :text,
            presence: true

  protected
    def create_html_from_markdown
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                         autolink: true, tables: true)
      self.text = markdown.render(self.text)
      self.description = markdown.render(self.description)
    end
end
