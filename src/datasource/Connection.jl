using SQLite
using DataFrames
using DataArrays

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

function querydf(db::SQLiteDB, sql::String)
  rs = query(db, sql)
  columnNames = rs.colnames
  columnValues = rs.values
  cols = length(rs.colnames)
  colnames = Array(Symbol, cols)
  colvalues = Array(Any, cols)
  for index in 1:cols
    colnames[index] = DataFrames.makeidentifier(columnNames[index])
    colvalues[index] = DataArrays.DataArray(columnValues[index])  
  end 
  DataFrame(colvalues, colnames)  
end
