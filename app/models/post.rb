class Post < ActiveRecord::Base
  after_validation :create_html_from_markdown, on: [ :create, :update ]

  belongs_to :journal

  has_attached_file :image, styles: { large: "1280x720" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  protected
    def create_html_from_markdown
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                         autolink: true, tables: true)
      self.text = markdown.render(self.text)
    end
end
