module SessionAnalytics

using Escher
using SQLite

include("analytics/Analytics.jl")
export SessionInfo, show, weightedAverage

include("datasource/Connection.jl")
export with, query, querydf

# include("ui/Render.jl")
# include("analytics/Example.jl")

include("sql/createDDLAndDML.jl") 
export createSchemaAndInitialData, createTable, insertSeedData, dropTable, verifyDataCreation


end

