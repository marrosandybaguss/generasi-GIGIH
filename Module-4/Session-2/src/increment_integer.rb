class IncrementInteger

    def increment(array)
        lastDigit = array[array.count-1]
        secondLastDigit = array[array.count-2]
        first = array[0]
        
        if lastDigit == 9
            if first == 9
                lastDigit = 0
                secondLastDigit = 0
                first = 0
                addInt = 1


                array[array.count-2] = secondLastDigit
                array[array.count-1] = lastDigit
                array[0] = first
                array.insert(0, addInt)
            else
                lastDigit = 0
                secondLastDigit += 1

                array[array.count-2] = secondLastDigit
                array[array.count-1] = lastDigit
            end
        else
            lastDigit += 1

            array[array.count-1] = lastDigit
        end

        array
    end

end