class Subdomain
  @pattern = Regexp.new(/(www|ftp|mail|blog|sftp|trial)/).freeze
  def self.matches?(request)
    request.subdomain.present? && !(request.subdomain =~ @pattern)
  end
end
