class Article < ActiveRecord::Base
  after_validation :create_html_from_markdown, on: [ :create, :update ]

  validates :title, :text,
            presence: true

  protected
    def create_html_from_markdown
      self.text = Markdown.new(self.text).to_html
    end
end
