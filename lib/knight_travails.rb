# frozen_string_literal: true

KNIGHT = "\u265E"
require_relative 'knight_travails/board'
require_relative 'knight_travails/square'

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
