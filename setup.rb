require 'dotenv'

class Setup
  attr_reader :environment

  def initialize
    if env_present?
      @environment = ENV['GOSEG_URL']
    end    
  end

  def env_present?
    begin
      env = File.open(".env", 'r')
      data = env.read
    rescue
      puts "There is no Env file - would you like to create one? (yes/no):"
      selection = input_yes_no
      if selection.eql? "Y"
        build_env_file
        puts ".env File built.  Please provide valid parameters. \n" +
            "\e[31m**WANRING** DO NOT SHARE THE ENV FILE - OR UPLOAD TO GITHUB\e[0m"
        Kernel.exit(0)
      else
        puts "Please provide an .env file."
        Kernel.exit(1)
      end
    end

    return false
  end

  def input_yes_no
    begin
      selection = gets
      selection = selection[0].upcase
      unless selection.eql? "Y" or selection.eql? "N"
        puts "There was a problem with your input - Please try again"
        input_yes_no
      end
    end
    selection
  end

  def build_env_file
    begin
      env_file = File.open(".env", "w")
      env_file.write("GOSEG_URL=<<GoSEGURL>>\n")
      env_file.write("Username=<<Username>>\n")
      env_file.write("Password=<<password>>\n")
      env_file.write("UserID=<<userid>>\n")
    rescue Exception => e
      puts "There was something wrong writing the .env file: #{e.to_s}"
    end
  end

  def setCredentials(username, password)
    @username = username
    @password = password
  end

end