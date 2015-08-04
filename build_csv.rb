require "csv"

class BuildCSV

  @recipient_count
  @email_domain
  @CSV_data

  def initialize(action, recipient_num, email_domain, filename)
    @recipient_count = recipient_num.to_i
    @email_domain = email_domain
    @filename = filename
    @CSV_data = Array.new
    build_csv_data
    if action.equal?'b'
      #build normal
      build_csv
    else
      #build single column
      single_column
    end
  end

  def build_csv
    #build headers
    CSV.open("generated_csvs/" + @filename + ".csv", "wb") do |csv|
      csv << ["first_name", "last_name", "email"]
    end
    #append data
    CSV.open("generated_csvs/" + @filename + ".csv", "a") do |csv|
      @CSV_data.each do |csvrow|
        csv << [csvrow[:first_name], csvrow[:last_name], csvrow[:email]]
      end
    end
  end

  def build_csv_data
    while @recipient_count > 0
      recipient_info = {:first_name => "#{@filename}_#{@recipient_count}_firstName", :last_name => "#{@filename}_#{@recipient_count}_lastname", :email => "auto_#{@recipient_count}@#{@email_domain}"}
      @CSV_data.push(recipient_info)
      @recipient_count -= 1
    end
  end

  def single_column
    CSV.open("generated_csvs/" + @filename + ".csv", "wb") do |csv|
      csv << ["email"]
    end
    CSV.open("generated_csvs/" + @filename + ".csv", "a") do |csv|
      @CSV_data.each do |csvrow|
        csv << [csvrow[:email]]
      end
    end
  end


end