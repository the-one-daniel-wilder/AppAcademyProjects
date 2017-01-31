require_relative "00_tree_node.rb"

class KnightPathFinder
attr_reader :tree, :visited

  KNIGHT_MOVES = {
    ul: [-1, 2],
    ur: [1, 2],
    ru: [2, 1],
    rd: [2, -1],
    dr: [1, -2],
    dl: [-1, -2],
    ld: [-2, -1],
    lu: [-2, 1]
  }

  def initialize(pos = [0, 0])
    @current_position = pos
    @visited = []
    @root = PolyTreeNode.new(pos)
    @tree = build_move_tree(pos)
  end

  def build_move_tree(pos)
    return if @visited.length == 64

    legal_moves = KNIGHT_MOVES.values.select do |move|
      next_move = [pos.first + move.first, pos.last + move.last]
      legal_move?(next_move)
    end

    legal_moves.each do |legal_move|
      @root.add_child(PolyTreeNode.new(legal_move))
      build_move_tree(legal_move)
    end
  end

  def legal_move?(move)
    return false if visited.include?(move)
    move.all? { |l| (0..7).include?(l) }
  end
end

knight_solver = KnightPathFinder.new
p knight_solver.tree
