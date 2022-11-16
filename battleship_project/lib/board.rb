class Board

  def self.print_grid(grid)
    grid.each do |row|
        puts row.join(" ")
    end
  end

  def initialize(n)
    @n = n
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def size
    @size
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, val)
    row, col = position
    @grid[row][col] = val
  end

    # review
  def num_ships
    @grid.flatten.count { |ele| ele == :S }

    # trying each loop and if statment but doesn't work..
    # count = 0
    # (0...@grid.length).each do |row|
    #     (0...@grid.length).each do |idx|
    #         count += 1 if @grid[row, idx] == :s
    #     end
    # end
    # count
  end


  def attack(position)
    if self.[](position) == :S
        self.[]=(position, :H)
        p "you sunk my battleship!"
        return true
    else
        self.[]=(position, :X)
        return false
    end
  end

    # review
  def place_random_ships
    total_ships = @size * 0.25
    while self.num_ships < total_ships
        rand_row = rand(0...@grid.length)
        rand_col = rand(0...@grid.length)
        pos = [rand_row, rand_col]
        self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
        row.map do |ele|
            if ele == :S
                :N
            else
                ele
            end
        end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
