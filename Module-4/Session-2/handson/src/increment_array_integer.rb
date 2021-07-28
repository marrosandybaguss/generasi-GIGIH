class IncrementArrayInteger

    def increment(array)
        banyaknya = array.count
        index = banyaknya -1

        array.reverse.each do |value|
            
            if value == 9
                array[index] = 0
            else
                array[index] += 1
                break
            end

            index -= 1
        end
        array
    end

end