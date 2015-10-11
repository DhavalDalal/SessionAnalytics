## SQLite3
* Run sqlite using, `/usr/bin/sqlite3 sessions.db`.  This creates a sessions.db file in the directory which you run.
* 


## MySQL
# Creating DSN 

#Windows
* Download mysql odbc driver from http://cdn.mysql.com/Downloads/Connector-ODBC/5.3/mysql-connector-odbc-5.3.4-winx64.msi
* Open ODBC DataSources
* Click User DSN Tab and click Add...
* Select the MySQL ODBC 5.3 Unicode Driver
* Click Finish.
** Give any Data Source Name: sessionAnalyticsDSN
** Give your mysql user name and password
** Select the database you want.

#OS X
* Download mysql odbc driver from https://dev.mysql.com/downloads/file.php?id=453045
* Follow instructions on: https://dev.mysql.com/doc/connector-odbc/en/connector-odbc-configuration-dsn-osx.html
* Good luck!

In case the above does not work, use an alternative unregistered Julia Packages.  On the Julia REPL, run the following in sequence
* `Pkg.clone("git@github.com:JuliaDB/DBI.jl.git")`
* `Pkg.clone("git@github.com:johnmyleswhite/MySQL.jl.git")`
* `using DBI`
* `using MySQL`
* `db = connect(MySQL5, "127.0.0.1", "root", "root", "test")`

