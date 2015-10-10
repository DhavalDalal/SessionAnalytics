module SessionAnalyticsSpecs
  using SessionAnalytics
  using Base.Test

  const sessionInfo = SessionInfo("CodeJugalbandi", [1, 2, 3], [4, 5, 6])
  function run()  
    # call tests here  
    sessionRatingBasedOnWeightedAverageOfMeanDelegatesRatingsAndMeanSpeakerParticipantsRatings()
    println("Tests passing. Good job.")
  end

  # define tests here  
  function sessionRatingBasedOnWeightedAverageOfMeanDelegatesRatingsAndMeanSpeakerParticipantsRatings()  
    @test 4.1 == weightedAverage([0.3, 0.7])(sessionInfo)
  end
  
end


