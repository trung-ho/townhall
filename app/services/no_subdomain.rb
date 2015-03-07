class NoSubdomain
  def self.matches?(request)
    request.subdomain == 'vote'
  end
end
