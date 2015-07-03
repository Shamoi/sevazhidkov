class Post < ActiveRecord::Base
  after_validation :create_html_from_markdown, on: [ :create, :update ]

  belongs_to :journal

  protected
    def create_html_from_markdown
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                         autolink: true, tables: true)
      self.text = markdown.render(self.text)
    end
end
