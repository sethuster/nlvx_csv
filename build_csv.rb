require "csv"

class BuildCSV

  @recipient_count
  @email_domain
  @CSV_data

  def initialize(recipient_num, email_domain)
    @recipient_count = recipient_num.to_i
    @email_domain = email_domain
    @CSV_data = Array.new
    build_csv_data
    build_csv
  end

  def build_csv
    #build headers
    CSV.open("test.csv", "wb") do |csv|
      csv << ["first_name", "last_name", "email"]
    end
    #append data
    CSV.open("test.csv", "a") do |csv|
      @CSV_data.each do |csvrow|
        csv << [csvrow[:first_name], csvrow[:last_name], csvrow[:email]]
      end
    end
  end

  def build_csv_data
    while @recipient_count > 0
      recipient_info = {:first_name => "auto_#{@recipient_count}_firstName", :last_name => "auto_#{@recipient_count}_lastname", :email => "auto_#{@recipient_count}@#{@email_domain}"}
      @CSV_data.push(recipient_info)
      @recipient_count -= 1
    end
  end


end