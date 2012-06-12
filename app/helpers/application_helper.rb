module ApplicationHelper

def javascript jsname
  jsname = ",#{jsname}" if content_for?(:javascripts)
  content_for(:javascripts, jsname)
end
def stylesheet cssname
  cssname = ",#{cssname}" if content_for?(:stylesheets)

  content_for(:stylesheets, cssname)
end

  def current_company
  	s = request.host.gsub(/\..*/, "").downcase
  	@company = Company.find_by_subdomain(s)
  end


end
