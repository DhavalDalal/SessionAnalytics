using SessionAnalytics

function main(window)
    # plaintext("Hello, World!")
    codeJugalbandi = SessionInfo("CodeJugalbandi", [1, 2, 3], [4, 5, 6])
    directFeedbackWeightedAvg = weightedAverage([0.3, 0.7])
    feedbackOnCodeJugalbandi = codeJugalbandi |> directFeedbackWeightedAvg
    plaintext("$feedbackOnCodeJugalbandi")
      
    push!(window.assets, "widgets")

       inp = Input(Dict())

       s = sampler()
       form = vbox(
           h1("Submit your Session Rating"),
           watch!(s, textinput("", name=:name, label="Your name")),
           hbox("Your rating", watch!(s, slider(1:10, name=:rating)))
               |> packacross(center),
           trigger!(s, button("Submit", name=:submit))
       ) |> maxwidth(400px)

       lift(inp) do dict
           vbox(
               plugsampler(s, form) >>> inp,
               vskip(2em),
               string(dict)
           ) |> pad(2em)
       end
    
end