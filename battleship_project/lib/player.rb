class Player

    # def get_move
    #     p "enter a position with coordinates separated with a space like '4 7'"

    #     # review syntax below
    #     gets.chomp.split(" ").map(&:to_i)
    # end




    def get_move
        p "enter a position with coordinates separated with a space like '4 7'"
        gets.chomp.split(" ").map(&:to_i)
    end
end
