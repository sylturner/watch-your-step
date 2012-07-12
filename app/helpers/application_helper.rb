module ApplicationHelper
  def markdown
    rndr = Redcarpet::Render::HTML.new(:filter_html => true, :hard_wrap => true) 
    Redcarpet::Markdown.new(rndr, :autolink => true, :space_after_headers => true)
  end
end
