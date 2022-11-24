class Board

    attr_reader :max_height

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    # def Board.build_stacks(num)
    #     Array.new(num) {Array.new(0)}
    # end

    # def initialize(num, max_height)
    #     raise "rows and cols must be >= 4" if num < 4 || max_height < 4
    #     @max_height = max_height
    #     @stacks = Board.build_stacks(num)
    # end

    # def add(token, idx)
    #     if @stacks[idx].length < @max_height
    #         @stacks[idx] << token
    #         return true
    #     elsif @stacks[idx].length == @max_height
    #         return false
    #     end

    #     # Spencer's ver
    #     # if @stacks[idx].length < max_height
    #     #     @stacks[idx] << token
    #     #     return true
    #     # else
    #     #     return false
    #     # end
    # end

    # def vertical_winner?(token)
    #     @stacks.any? { |stack| stack.length == @max_height && stack.include?(token) }


    #     @stacks.each do |stack|
    #         if stack.length == @max_height && stack.all?(token)
    #             return true
    #         end
    #     end
    #     false

    #     # Spencer's ver
    #     # @stacks.any? do |stack|
    #     #     if stack.length == max_height && stack.all? { |ele| ele == token }
    #     #         return true
    #     #     end
    #     # end
    #     # false
    # end

    # def horizontal_winner?(token)
    #     # count = 0
    #     # (0...@max_height).each do |i|
    #     #     @stacks.each do |stack|
    #     #         count += 1 if stack[i] == token
    #     #     end
    #     #     return true if count == @stacks.length
    #     #     count = 0
    #     # end
    #     # false

    #     # Charles ver, works
    #     # (0...max_height).each do |idx|
    #     #     return true if (0...@stacks.length).all? { |jdx| @stacks[jdx][idx] == token }
    #     # end
    #     # false

    #     # Spencer's ver, works
    #     (0...max_height).each do |i|
    #         horizontal = []
    #         (0...@stacks.length).each do |j|
    #             if @stacks[j][i]
    #                 horizontal << @stacks[j][i]
    #             end
    #         end
    #         if horizontal.length == @stacks.length
    #             return true if horizontal.all? { |ele| ele == token }
    #         end
    #     end
    #     false
    # end

    # def winner?(token)
    #     vertical_winner?(token) || horizontal_winner?(token)
    # end


    attr_reader :max_height
    def Board.build_stacks(num)
        Array.new(num) {Array.new(0)}
    end

    def initialize(num_stacks, max_height)
        raise "rows and cols must be >= 4" if num_stacks < 4 || max_height < 4
        @max_height = max_height
        @stacks = Board.build_stacks(num_stacks)
    end

    def add(token, idx)
        if @stacks[idx].length < @max_height
            @stacks[idx] << token
            return true
        end
        false
    end

    def vertical_winner?(token)
        @stacks.each do |stack|
            return true if stack.length == @max_height && stack.include?(token)
        end
        false
    end

    def horizontal_winner?(token)
        count = 0
        (0...@max_height).each do |i|
            @stacks.each do |stack|
                count += 1 if stack[i] == token
            end
            return true if count == @stacks.length
            count = 0
        end
        false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end
end
