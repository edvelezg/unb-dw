#!/usr/bin/ruby -w
# simple.rb - simple MySQL script using Ruby MySQL module

# update user set Password=PASSWORD('mondrian') WHERE User='ed';

# SELECT book_id, place_id, count(*) from sentence_and_place group by book_id, place_id;
# SELECT book_id, t1.place_id, t2.place_name, COUNT(*) FROM sentence_and_place AS t1 INNER JOIN place AS t2 ON t1.place_id = t2.place_id GROUP BY t2.place_id, book_id;


require "mysql"

var1 = "snake"
mtr = 
[
  ["'#{var1}'", "'reptile'"],
  ["'frog'", "'amphibian'"],
  ["'tuna'", "'fish'"],
  ["'racoon'", "'mammal'"]
]

arr = []
mtr.each { |e| arr << "(#{e.join(',')})" }
table = arr.join(",\n")

begin
  # connect to the MySQL server
  dbh = Mysql.real_connect("localhost", "ed", "mondrian", "litolap")

  # get server version string and display it
  puts "Server version: " + dbh.get_server_info
  
  dbh.query("DROP TABLE IF EXISTS sentence")
  dbh.query("CREATE TABLE sentence
             (
               book_id      INT UNSIGNED,
               sentence_id  INT UNSIGNED,
               sentence     VARCHAR(5000)
             )
           ")

   dbh.query("DROP TABLE IF EXISTS sentence_and_place")
   dbh.query("CREATE TABLE sentence_and_place
              (
                book_id     INT UNSIGNED,
                sentence_id INT UNSIGNED,
                place_id    INT UNSIGNED,
                frequency   INT UNSIGNED
              )
            ")

    dbh.query("DROP TABLE IF EXISTS place")
    dbh.query("CREATE TABLE place
               (
                 place_id     INT UNSIGNED,
                 place_name   VARCHAR(200)
               )
             ")

    dbh.query("LOAD DATA LOCAL INFILE '/Users/Naix/Tmp/unb-dw/project/XMLtoRel/places.txt' INTO TABLE place")
    dbh.query("LOAD DATA LOCAL INFILE '/Users/Naix/Tmp/unb-dw/project/XMLtoRel/sentences.txt' INTO TABLE sentence")
    dbh.query("LOAD DATA LOCAL INFILE '/Users/Naix/Tmp/unb-dw/project/XMLtoRel/sentences_and_places.txt' INTO TABLE sentence_and_place")


  # dbh.query("INSERT INTO animal (name, category)
  #              VALUES
  #              #{table}
  #            ")
  # puts "Number of rows inserted: #{dbh.affected_rows}"
  
  # issue a retrieval query, perform a fetch loop, print
    # the row count, and free the result set

    # res = dbh.query("SELECT name, category FROM animal")
    # 
    # while row = res.fetch_row do
    #   printf "%s, %s\n", row[0], row[1]
    # end
    # puts "Number of rows returned: #{res.num_rows}"
    # 
    # res.free
  
rescue Mysql::Error => e
  puts "Error code: #{e.errno}"
  puts "Error message: #{e.error}"
  puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
ensure
  # disconnect from server
  dbh.close if dbh
end
