require_relative 'piece'
# require 'byebug'
class Board
  attr_reader :CHESS_SYMBOLS, :board

  CHESS_SETUP = [
    [:r, :kn, :b, :q, :k, :b, :kn, :r],
    [:p, :p, :p, :p, :p, :p, :p, :p]
  ]
  # CHESS_SYMBOLS = { p: "pawn", k: "king", q: "queen", b: "bishop", kn: "knight", r: "rook" }

  def initialize
    @board = default_board
  end

  def default_board
    #goes through @Board and lays out chess pieces
    black = CHESS_SETUP.map.with_index do |row, row_idx|
      row.map.with_index do |square, square_idx|
        piece_type = CHESS_SETUP[row_idx][square_idx]
        Piece.new_piece(piece_type)
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
    raise "ERROR: no piece at position" unless valid_start_pos?(start_pos) && valid_end_pos?(end_pos)

    x1, y1 = start_pos
    x2, y2 = end_pos
    @board[x1][y1], @board[x2][y2] = @board[x2][y2], @board[x1][y1]
  end

  def self.in_board?(pos)
    x,y = pos
    return true if (0..7).include?(x) && (0..7).include?(y)
    false
  end

  def blank?(pos)
    x,y = pos
    piece_in_space = @board[x][y]
    piece_in_space.is_a?(NullPiece)
  end

  def valid_start_pos?(pos)
    Board.in_board?(pos) && !blank?(pos)
  end

  def valid_end_pos?(pos)
    x,y = pos
    Board.in_board?(pos) && blank?(pos)
  end
    # The Board class should have a #move_piece(start_pos, end_pos) method. This should update the 2D grid and also the moved piece's position. You'll want to raise an exception if:
    # there is no piece at start_pos or
    # the piece cannot move to end_pos.
  # def move_ok?(piece, pos, end_pos)
  # end
end
