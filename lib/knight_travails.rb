# frozen_string_literal: true

KNIGHT = "\u265E"

# class Square
class Square
  attr_accessor :piece
  def initialize(piece = '_')
    @piece = piece
  end
end

# class Board
class Board
  attr_accessor :board
  def initialize(board = empty_board)
    @board = board
  end

  def empty_board
    Array.new(8) { Array.new(8) { Square.new } }
  end

  def print_board
    board.each do |row|
      row.each do |square|
        print square.piece + ' '
      end
      puts
    end
  end

  def set_square(file, rank)
    board[(file - 8).abs][rank - 1].piece = KNIGHT
  end
end

board = Board.new
board.set_square(rand(1..8), rand(1..8))
board.print_board
