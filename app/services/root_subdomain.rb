class RootSubdomain
  def self.matches?(request)
    request.subdomain.blank? || request.subdomain == 'trial'
  end
end
