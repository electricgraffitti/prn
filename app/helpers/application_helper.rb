# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def page_title(page_title)
    content_for(:title) { page_title}
  end
  
  def meta_keywords(meta_keywords)
    content_for(:keywords) {meta_keywords}
  end
  
  def meta_description(meta_description)
    content_for(:description) {meta_description}
  end
  
  def javascript(url)
      content_for :javascript do
        javascript_include_tag url
      end
    end

end
