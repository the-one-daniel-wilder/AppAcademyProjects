require 'singleton'
class Piece
  def initialize(piece)
    @piece = piece
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
  end

end

class Pawn < Piece

  def initialize

  end


end

class King < Piece
  def initialize
  end
end

class Queen < Piece
  def initialize
  end
end

class Bishop < Piece
  def initialize
  end


end

class Knight < Piece
  def initialize
  end
  # (x).abs == 1 && (y).abs == 2 || (x).abs == 2 && (y).abs == 1
end

class Rook < Piece
  def initialize
  end
end
