# Ruby-CSV-Uploader
This was built as a testing tool for early versions of SendGrid's Marketing Campaigns application.
Simple CSV Creator and Parser

## How to Use

CD into nlvx_csv directory.

Parameters:
b = build CSV only  
u = upload CSV <Requires env file>  
s = single column CSV file
Num = number of recipients to create  
domain = domain of recipient email  
filename = the name of the csv file to be generated  

This will build 420 recipients called example.csv with @example.com:  
ruby start.rb b 420 @example.com  example

###Enjoy!



