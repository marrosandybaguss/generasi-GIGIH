class IncrementInteger

    def increment(array)
        lastDigit = array[array.count-1]
        secondLastDigit = array[array.count-2]
        
        if(lastDigit == 9)
            lastDigit = 0
            secondLastDigit += 1
        else
            lastDigit += 1
        end

        array[array.count-2] = secondLastDigit
        array[array.count-1] = lastDigit
        array
    end

end