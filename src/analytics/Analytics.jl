immutable SessionInfo
  name::String
  meanFeedbackFromParticipants::Float64
  meanFeedbackFromSpeakers::Float64
end

SessionInfo(name::String, feedbackFromParticipants::Array{Int64, 1}, feedbackFromSpeakers::Array{Int64, 1}) = 
  SessionInfo(name, feedbackFromParticipants |> mean, feedbackFromSpeakers |> mean)

show(io::IO, s::SessionInfo) = println(io, "$(s.name) [$(s.meanFeedbackFromParticipants),$(s.meanFeedbackFromSpeakers)]")

show(s::SessionInfo) = show(STDOUT, s)

weightedAverage(weights::Array{Float64, 1}) = return function (s::SessionInfo)
    wa = [s.meanFeedbackFromParticipants s.meanFeedbackFromSpeakers] * weights / sum(weights)
    wa[1]
end    

