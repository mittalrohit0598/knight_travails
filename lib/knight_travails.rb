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
    board[(file - 7).abs][rank].piece = KNIGHT
  end
end

def backtrace(parent, start, finish)
  path = [finish]
  path.unshift(parent[path[0]]) while path[0] != start
  path
end

def possible_knight_moves(square)
  moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  moves.map! { |move| [move[0] + square[0], move[1] + square[1]] }
  moves.select { |move| (0...8).include?(move[0]) && (0...8).include?(move[1]) }
end

def knight_moves(start, finish)
  parent = {}
  queue = [start]
  until queue.empty?
    node = queue.shift
    return backtrace(parent, start, finish) if node == finish

    possible_knight_moves(node).each do |move|
      parent[move] = node unless parent.key?(move)
      queue.push(move)
    end
  end
end

board = Board.new
path = knight_moves([3, 3], [4, 3])
path.each { |move| board.set_square(move[0], move[1]) }
board.print_board
p path
