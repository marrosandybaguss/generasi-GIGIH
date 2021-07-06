class Samurai < Player
    
    def deflect()
        probability = [true, true, true, true, true, true, true, true, false, false]
        probability.shuffle.first
    end
    
end