class Wli
    attr_accessor :names

    def initialize
        @names = []
    end

    def likes
        if @names.count == 0
            "no one like this"
        elsif @names.count == 1
            "#{@names[0]} like this"
        elsif @names.count == 2
            "#{@names[0]} and #{@names[1]} like this"
        elsif @names.count == 3
            "#{@names[0]}, #{@names[1]} and #{@names[2]} like this"
        else
            other = @names.count - 2
            "#{@names[0]}, #{@names[1]} and #{other} others like this"
        end
        
    end
end
