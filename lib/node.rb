class Node

  attr_reader :value
  attr_accessor :right_node, :left_node
  def initialize(value = nil, left_node = nil, right_node = nil)
    @value      = value
    @left_node  = left_node
    @right_node = right_node
  end
end
