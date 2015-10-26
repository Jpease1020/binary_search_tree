require_relative "node"
require 'pry'

class BinaryTree
  attr_accessor :head
  def initialize(value = nil)
    @head = Node.new(value)
  end

  def insert(value = nil, this_node = @head)
    if value > this_node.value && !this_node.right_node
      this_node.right_node = Node.new(value)
    elsif value > this_node.value && this_node.right_node
      insert(value, this_node.right_node)
    elsif value < this_node.value && !this_node.left_node
      this_node.left_node = Node.new(value)
    elsif value < this_node.value && this_node.left_node
      insert(value, this_node.left_node)
    end
  end
end
