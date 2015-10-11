module AnalyticsSpecs
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
      @test weightedAverage([0.3, 0.7])(sessionInfo) == 4.1
      @test weightedAverage([0.4, 0.6])(sessionInfo) == 3.8
  end
end
