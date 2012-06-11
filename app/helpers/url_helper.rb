module UrlHelper
  def with_subdomain(subdomain)
    subdomain = (subdomain || "")
    subdomain += "." unless subdomain.empty?
    [subdomain, request.domain].join
  end
  
  def url_for(options = nil)
    if options.kind_of?(Hash) && options.has_key?(:subdomain)
      options[:host] = with_subdomain(options.delete(:subdomain))
    end
    if options.kind_of?(Hash) && options.has_key?(:user)
      options.delete(:subdomain)
      options[:host] = with_subdomain(options[:user].company.domain)
    end
    super
  end
end