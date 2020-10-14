# frozen_string_literal: true

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
    board[(file - 7).abs][rank].piece = KNIGHT
  end
end
