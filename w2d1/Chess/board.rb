require_relative 'piece'
require 'byebug'
class Board
  attr_reader :CHESS_SYMBOLS

  CHESS_SETUP = [
    [[:r], [:kn], [:b], [:q], [:k], [:b], [:kn], [:r]],
    [[:p], [:p], [:p], [:p], [:p], [:p], [:p], [:p]]
  ]
  CHESS_SYMBOLS = { p: Proc.new{Pawn.new}, k: Proc.new{King.new}, q: Proc.new{Queen.new}, b: Proc.new{Bishop.new}, kn: Proc.new{Knight.new}, r: Proc.new{Rook.new} }

  def initialize()
    @board = default_board
  end

  def default_board
    #goes through @Board and lays out chess pieces
    black = CHESS_SETUP.map.with_index do |row, row_idx|
      row.map.with_index do |square, square_idx|
        piece_type = CHESS_SETUP[row_idx][square_idx]
        CHESS_SYMBOLS[piece_type[0]].call
      end
    end

    empty = Array.new(4) {Array.new(8) {NullPiece.instance}}
    white = Board.deep_dup(black).reverse
    black + empty + white
  end

  def self.deep_dup(array)
    duped = []
    array.each do |el|
      if el.is_a?(Array)
        duped << deep_dup(el)
      else
        duped << el
      end
    end

    duped
  end

  def move_piece(start_pos, end_pos)

  end

  def valid_space?
  end
    # The Board class should have a #move_piece(start_pos, end_pos) method. This should update the 2D grid and also the moved piece's position. You'll want to raise an exception if:
    # there is no piece at start_pos or
    # the piece cannot move to end_pos.

end
