using SessionAnalytics
import SessionAnalytics.show

codeJugalbandi = SessionAnalytics.SessionInfo("CodeJugalbandi", [1, 2, 3], [4, 5, 6])
show(STDOUT, codeJugalbandi)
directFeedbackWeightedAvg = weightedAverage([0.3, 0.7])
feedbackOnCodeJugalbandi = codeJugalbandi |> directFeedbackWeightedAvg
println(feedbackOnCodeJugalbandi)
