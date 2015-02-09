class Setup
  attr_reader :environment

  def initialize
    @environment = ENV['GOSEG_URL']
  end

  def setCredentials(username, password)
    @username = username
    @password = password
  end

end