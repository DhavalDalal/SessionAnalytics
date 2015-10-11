using SQLite

# Loan My Resource
function with(f::Function, dbName::String) 
  try
    db = SQLiteDB(dbName)
    f(db)    
    close(db)
  catch e
    println(e)
  end
end

query(db::SQLiteDB, sql::String) = SQLite.query(db, sql)
