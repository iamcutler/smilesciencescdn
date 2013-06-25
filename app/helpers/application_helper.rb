module ApplicationHelper
  def addStylesheet(style)
    content_for :head do
      "<link type=\"text/css\" href=\"/assets/#{style}\" rel=\"stylesheet\" />".html_safe
    end
  end

  def additionalJS(script)
    content_for :additional_javascript do
      "<script type=\"text/javascript\" src=\"/assets/#{script}\"></script>".html_safe
    end
  end
end
