module ApplicationHelper
  def pageTitle(title)
    content_for :title, title.to_s
  end

  def addStylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end

  def additionalJS(*files)
    content_for(:additional_scripts) { javascript_include_tag(*files) }
  end

  def line_break(string)
    string.gsub("\n", '<br/>')
  end
end
