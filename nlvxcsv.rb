class Nlvxcsv

  #action (build, upload)
  #key (number of recipients, goseg address)
  #status (email domain, list)
  def initialize(arg)
    setup = Setup.new
    @user_input = arg
    @user_input_hash = {
        :action => @user_input[0],
        :key => @user_input[1],
        :status => @user_input[2],
        :filename => @user_input[3]
        }
    process_args
  end

  def process_args
    if @user_input_hash[:action] == 'b'
      makecsv = BuildCSV.new(@user_input_hash[:key], @user_input_hash[:status], @user_input_hash[:filename])
      #puts @user_input_hash[:key] + @user_input_hash[:status]
    end
    if @user_input_hash[:action] == 'u'
      #Call the upload CSV class
    end
  end


end