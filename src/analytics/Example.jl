using SessionAnalytics
using SQLite
import SessionAnalytics.show

codeJugalbandi = SessionInfo("CodeJugalbandi", [1, 2, 3], [4, 5, 6])

show(STDOUT, codeJugalbandi)

directFeedbackWeightedAvg = weightedAverage([0.3, 0.7])
feedbackOnCodeJugalbandi = codeJugalbandi |> directFeedbackWeightedAvg
println(feedbackOnCodeJugalbandi)


# Connect to SQLite and execute the query to get ResultSet
with("sessions.db") do db
  rs = query(db, "select * from sessions")
  println(rs)
end

# Connect to SQLite and execute the query to get DataFrame
with("sessions.db") do db
  df = querydf(db, "select * from sessions")
  println(df)
end
