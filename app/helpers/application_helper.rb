module ApplicationHelper

def javascript jsname
  jsname = ",#{jsname}" if content_for?(:javascripts)
  content_for(:javascripts, jsname)
end
def stylesheet cssname
  cssname = ",#{cssname}" if content_for?(:stylesheets)

  content_for(:stylesheets, cssname)
end


end
