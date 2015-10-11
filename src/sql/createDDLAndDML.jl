using SQLite
using Base.Test

function run(dbName::String)
  println("Connecting to database....$(dbName)")
  db = SQLiteDB(dbName)
  println("Inserting data into table...sessions")
  dropTable(db)
  println("Creating table...sessions")
  createTable(db)
  println("Inserting data into table...sessions")
  insertSeedData(db)
  println("Verifying Data created...in sessions")
  verifyDataCreation(db)
  close(db)
  println("DONE.")
end

function createTable(db)
  sql = "CREATE TABLE sessions (id INT(11), delegateId INT(11), isSpeaker CHAR(1), rating INT(11), createdOn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)"
  query(db, sql)
end
 
function insertSeedData(db)
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 1, 'Y', 5)")
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 2, 'Y', 4)")
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 3, 'Y', 3)")
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 4, 'N', 3)")
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 5, 'N', 2)")
  query(db, "INSERT INTO sessions (id, delegateId, isSpeaker, rating) VALUES (1, 6, 'N', 1)")
end

function dropTable(db)
  query(db, "DROP TABLE sessions")
end

function verifyDataCreation(db)
  rs = query(db, "SELECT * from sessions")
  @test length(rs.values[2]) == 6
end
