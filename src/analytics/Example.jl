using SessionAnalytics
import SessionAnalytics.show

codeJugalbandi = SessionInfo("CodeJugalbandi", [1, 2, 3], [4, 5, 6])

show(STDOUT, codeJugalbandi)

directFeedbackWeightedAvg = weightedAverage([0.3, 0.7])
feedbackOnCodeJugalbandi = codeJugalbandi |> directFeedbackWeightedAvg
println(feedbackOnCodeJugalbandi)


# Connect to SQLite and execute the query
with("sessions.db") do db
  rs = query(db, "select * from sessions")
  typeof(rs)
  println(rs)
end
