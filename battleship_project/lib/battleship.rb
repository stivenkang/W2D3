require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size * 0.5
    end

    def start_game
        @board.place_random_ships
        puts "Number of ships: #{@board.num_ships}"
        p @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        end
        false
    end

    def win?
        if @board.num_ships == 0
            p "you win"
            return true
        end
        false
    end

    def game_over?
        if self.win? || self.lose?
            return true
        end
        false
    end

        # check flow of logic
    def turn
        if @board.attack(@player.get_move) == false
            @remaining_misses -= 1
        end
        @board.print
        puts "Remaining misses: #{@remaining_misses}"
    end
end
