using SQLite

function with(f::Function, dbName::String) 
  try
    db = SQLiteDB(dbName)
    f(db)    
    close(db)
  catch e
    println(e)
  end
end
