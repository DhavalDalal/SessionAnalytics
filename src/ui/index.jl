using SessionAnalytics

createSchemaAndInitialData("sessions.db")

colnames = String[]
colvalues = ["1", "2", "3", "4", "5"]
with("sessions.db") do db
  rs = query(db, "select * from sessions")
  push!(colnames, rs.colnames...)
  #push!(colvalues, rs.values)
end

codeJugalbandi = SessionInfo("CodeJugalbandi", [1, 2, 3], [4, 5, 6]) 
directFeedbackWeightedAvg = weightedAverage([0.3, 0.7])
feedbackOnCodeJugalbandi = codeJugalbandi |> directFeedbackWeightedAvg

a,b,c,d = map(fillcolor, ["#837", "#859", "#837", "#859", "#837"],
    map(pad([left, right], 1em), ["A", "B", "C", "D", "E"]))

function main(window)
    paddedHeader = map(pad([left, right], 1em), colnames)
    colors = ["#892", "#892", "#892", "#892", "#892"]
    header = map(fillcolor, colors, paddedHeader)

    paddedRows = map(pad([left, right], 1em), colvalues)
    rows = map(fillcolor, colors, paddedRows)
    vbox(
      hbox(intersperse(hskip(1em), header)),
      hbox(intersperse(hskip(1em), rows))
   )   
end
