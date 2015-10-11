using SQLite
using Base.Test

function createSchemaAndInitialData(dbName::String)
  with(dbName) do db 
    println("Dropping table...$(dbName)")
    dropTable(db)
    println("Creating table...$(dbName)")
    createTable(db)
    println("Inserting data into table...$(dbName)")
    insertSeedData(db)
    println("Verifying Data created...in $(dbName)")
    verifyDataCreation(db)
    println("DONE.")
  end
end

function createTable(db::SQLiteDB)
  sql = "CREATE TABLE sessions (id INT(11), delegateId INT(11), isSpeaker CHAR(1), rating INT(11), createdOn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)"
  query(db, sql)
end
 
function insertSeedData(db::SQLiteDB)
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 1, 'Y', 5)")
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 2, 'Y', 4)")
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 3, 'Y', 3)")
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 4, 'N', 3)")
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 5, 'N', 2)")
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 6, 'N', 1)")
end

function dropTable(db::SQLiteDB)
  droptable(db, "sessions")
end

function verifyDataCreation(db::SQLiteDB)
  rs = query(db, "SELECT * from sessions")
  @test length(rs.values[2]) == 6
end
