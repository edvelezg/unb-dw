#!/usr/bin/env bash
# http://jaikiran.wordpress.com/2006/07/05/i-get-log4jwarn-no-appenders-could-be-found-for-logger-message-2/
function exists {
  if [[ ! -f $1 ]]; then
    echo "$1 does not exist"
    exit
  fi
}

exists "mondrian/lib/mondrian.jar"                                                                      # mondrian/lib/mondrian.jar
exists "mondrian/lib/log4j-1.2.8.jar"                                                                   # mondrian/lib/log4j.jar
exists "mondrian/lib/commons-logging-1.0.4.jar"                                                         # mondrian/lib/commons-logging.jar
exists "mondrian/lib/eigenbase-xom.jar"                                                                 # mondrian/lib/eigenbase-xom.jar
exists "mondrian/lib/eigenbase-resgen.jar"                                                              # mondrian/lib/eigenbase-resgen.jar
exists "mondrian/lib/eigenbase-properties.jar"                                                          # mondrian/lib/eigenbase-properties.jar
exists "/Users/Naix/Tmp/unb-dw/project/mysql-connector-java-5.1.15/mysql-connector-java-5.1.15-bin.jar" # /usr/local/mysql/mysql-connector-java-5.0.5-bin.jar

java -cp "mondrian/lib/mondrian.jar:mondrian/lib/log4j-1.2.8.jar:mondrian/lib/commons-logging-1.0.4.jar:mondrian/lib/eigenbase-xom.jar:mondrian/lib/eigenbase-resgen.jar:mondrian/lib/eigenbase-properties.jar:/Users/Naix/Tmp/unb-dw/project/mysql-connector-java-5.1.15/mysql-connector-java-5.1.15-bin.jar" mondrian.test.loader.MondrianFoodMartLoader -verbose -tables -data -indexes -jdbcDrivers=com.mysql.jdbc.Driver -inputFile=mondrian/demo/FoodMartCreateData.sql -outputJdbcURL="jdbc:mysql://localhost/foodmart?user=foodmart&password=foodmart"


# mondrian.rolap.aggregates.Use=true
# mondrian.rolap.aggregates.Read=true
# mondrian.native.topcount.enable=true
# mondrian.native.filter.enable=true
# 
# # mondrian.properties
# mondrian.result.limit=50000
# # For XML/A JSPs
# # mondrian.test.connectString=Provider=mondrian;Jdbc=jdbc:odbc:MondrianFoodMart;
# JdbcDrivers=sun.jdbc.odbc.JdbcOdbcDriver;Catalog=/WEB-INF/queries/FoodMart.xml;
# 
# mondrian.test.connectString=Provider=mondrian;Jdbc=jdbc:mysql://localhost/foodma
# rt?user=foodmart&password=foodmart;Catalog=/WEB-INF/queries/FoodMart.xml;JdbcDri
# vers=com.mysql.jdbc.Driver;

# edit fourhier.jsp  mondrian.jsp  colors.jsp  arrows.jsp

# Interesting queries

# select {[Measures].[Unit Sales]} ON COLUMNS,
#   Hierarchize([Customers].[USA].[CA].[ARCADIA].Children) ON ROWS
# from [Sales]

# select {[Gender].[F], [Gender].[M]} ON COLUMNS,
#   Crossjoin({[Customers].Children}, {[Education Level].Children}) ON ROWS
# from [Sales]

# select NON EMPTY ({[Time].[1997].[Q1].Children}, {[Gender].Children}) ON COLUMNS,
#   NON EMPTY Crossjoin({[Customers].Children}, {[Education Level].Children}) ON ROWS
# from [Sales]

# select {[Gender].Children} ON COLUMNS,
#    filter({ [Education Level].[Bachelors Degree] : [Education Level].[Partial College]}, )..
#      ON ROWS
# from [Sales]
# where [Measures].[Customer Count]
