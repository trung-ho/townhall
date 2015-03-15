class Subdomain
  @pattern = Regexp.new(/(www|ftp|mail|blog|sftp|vote)/).freeze
  def self.matches?(request)
    request.subdomain.present? && !(request.subdomain =~ @pattern)
    return true
  end
end
