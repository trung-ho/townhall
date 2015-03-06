class Subdomain
  @pattern = Regexp.new(/(www|ftp|mail|blog|sftp)/).freeze
  def self.matches?(request)
    request.subdomain.present? && !(request.subdomain =~ @pattern)
    return true
  end
end
