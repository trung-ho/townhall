class RootSubdomain
  def self.matches?(request)
    request.subdomain.blank? || request.subdomain == 'vote'
  end
end
