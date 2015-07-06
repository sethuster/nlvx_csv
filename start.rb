require 'rest-client'
require 'json'

require_relative 'Setup'
require_relative 'nlvxcsv'
require_relative 'build_csv'

#The purpose of this script will be to build test csv files quickly
#Next I want to be able to upload them through go_seg
#DO NOT STORE PASSWORDS in this repository

@nlvxcsv = Nlvxcsv.new(ARGV)