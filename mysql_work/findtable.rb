#!/usr/bin/ruby -w
# simple.rb - simple MySQL script using Ruby MySQL module

# update user set Password=PASSWORD('mondrian') WHERE User='ed';

require "mysql"

begin
  # connect to the MySQL server
  dbh = Mysql.real_connect("localhost", "ed", "mondrian", "test")
  # get server version string and display it
  puts "Server version: " + dbh.get_server_info
    
  # issue a retrieval query, perform a fetch loop, print
    # the row count, and free the result set

  res = dbh.query("SELECT name, category FROM animal WHERE name='frog'")
  
  puts res.num_rows
  
  while row = res.fetch_row do
    printf "%s, %s\n", row[0], row[1]
  end
  puts "Number of rows returned: #{res.num_rows}"
  
  res.free
  
rescue Mysql::Error => e
  puts "Error code: #{e.errno}"
  puts "Error message: #{e.error}"
  puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
ensure
  # disconnect from server
  dbh.close if dbh
end
