module SessionAnalytics

using Escher
using SQLite

include("analytics/Analytics.jl")
export SessionInfo, show, weightedAverage

include("datasource/Connection.jl")
export with, query

# include("ui/Render.jl")
# include("analytics/Example.jl")

include("sql/createDDLAndDML.jl") 
export createSchemaAndInitialData, createTable, insertSeedData, dropTable, verifyDataCreation

println("Make sure you have sqllite3 on your path (/usr/bin/sqlite3)")
println("Go to sql folder in this project and run the command below:")
println("--> sqlite3 sessions.db <--")
println("At the julia prompt")
println("You may then want to run createSchemaAndInitialData(\"sessions.db\") to create database and tables")

end

