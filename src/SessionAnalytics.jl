using Escher

include("analytics/Analytics.jl")
include("../sql/createDDLAndDML.jl")
println("Make sure you have sqllite3 on your path (/usr/bin/sqlite3)")
println("Go to sql folder in this project and run the command below:")
println("sqlite3 sessions.db")
println("You may then want to run CreateDDLAndDML.run() to create database and tables")
# include("ui/Render.jl")
# include("analytics/Example.jl")

