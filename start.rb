require 'rest-client'
require 'json'

require_relative 'Setup'
require_relative 'nlvxcsv'

#TODO 1) Need to read the header rows from the CSV
#TODO 2) Identify the standard fields (firstname, lastname, email)
#TODO 3) Identify the custom fields and their type (text, number, date)
#TODO 4) Connect to the API - delete existing custom fields
#TODO 5) Connect to the API - Set up new custom fields
#Upload new Contacts from CSV
#Verifiy upload

@nlvxcsv = Nlvxcsv.new(ARGV)