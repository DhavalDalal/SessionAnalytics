module SessionAnalytics

  export SessionInfo, show, weightedAverage

  immutable SessionInfo
    name::AbstractString
    meanFeedbackFromParticipants::Float64
    meanFeedbackFromSpeakers::Float64
  end
  
  SessionInfo(name::AbstractString, feedbackFromParticipants::Array{Int64, 1}, feedbackFromSpeakers::Array{Int64, 1}) = 
    SessionInfo(name, feedbackFromParticipants |> mean, feedbackFromSpeakers |> mean)
  
  show(io::IO, s::SessionInfo) = println(io, "$(s.name) [$(s.meanFeedbackFromParticipants),$(s.meanFeedbackFromSpeakers)]")
  
  show(s::SessionInfo) = show(STDOUT, s)
  
  weightedAverage(weights::Array{Float64, 1}) = return function (s::SessionInfo)
      [s.meanFeedbackFromParticipants s.meanFeedbackFromSpeakers] * weights / sum(weights)
  end    
  
end

