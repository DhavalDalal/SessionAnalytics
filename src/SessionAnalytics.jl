module SessionAnalytics

using Escher

include("analytics/Analytics.jl")
export SessionInfo, show, weightedAverage


# include("ui/Render.jl")
# include("analytics/Example.jl")

include("sql/createDDLAndDML.jl") 
export run, createTable, insertSeedData, dropTable, verifyDataCreation

println("Make sure you have sqllite3 on your path (/usr/bin/sqlite3)")
println("Go to sql folder in this project and run the command below:")
println("--> sqlite3 sessions.db <--")
println("At the julia prompt create Database connection using: db = SQLiteDB(\"sessions.db\")")
println("You may then want to run SessionAnalyticsDDLAndDML.run(db) to create database and tables")
end

