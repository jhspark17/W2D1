class Board
  def self.default_grid
    Array.new
  end

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def []=(pos, value)
    row, column = pos
    grid[row][column] = value
  end
  
  def [](pos)
    row, column = pos
    grid[row][column]
  end

  def populate_grid
    grid.each_with_index do |row, idx|
      if [0, 1, 6, 7].include?(idx)
        row.each_with_index do |pos, idx|
          if idx == 0 || idx == row.length - 1
            pos = Piece.new(Bishop)
          elsif idx == 1 || idx == row.length - 2
            pos = Piece.new(Knight)
          elsif
      end
    end
  end

  private
  attr_reader :grid


end