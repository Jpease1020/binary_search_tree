require_relative "node"
require 'pry'

class BinaryTree
  attr_accessor :head
  def initialize(value = nil)
    @head = Node.new(value)
  end

  def insert(value, this_node = @head)
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

  def find_node(value, this_node = @head)
    if this_node && value == this_node.value
      this_node
    elsif this_node && value > this_node.value
      find_node(value, this_node.right_node)
    elsif this_node && value < this_node.value && this_node.left_node
      find_node(value, this_node.left_node)
    else
      false
    end
  end

  def include?(value, this_node = @head)
    if find_node(value, this_node) != false
      true
    else
      find_node(value, this_node)
    end
  end

  def depth_of?(value, this_node = @head, counter = 0)
    if find_node(value, this_node) == false
      counter = 0
    end
    if value == this_node.value
      counter += 1
      return counter
    elsif (value > this_node.value) && !this_node.right_node
      counter
    elsif (value > this_node.value) && this_node.right_node
      counter += 1
      depth_of?(value, this_node.right_node, counter)
    elsif value < this_node.value && !this_node.left_node
      counter
    elsif value < this_node.value && this_node.left_node
      counter += 1
      depth_of?(value, this_node.left_node, counter)
    end
  end

  def tree_to_array(this_node = @head, array = [])
    if this_node
      array << this_node.value
    end
    if this_node && (this_node.right_node || this_node.left_node)
      tree_to_array(this_node.right_node, array)
      tree_to_array(this_node.left_node, array)
    end
    array
  end

  def sorted_insert(num, array = [], index = 0)
    if array[0] == nil
      array << num
    elsif num <= array[index]
      array.unshift(num)
    elsif num >= array[-1]
      array << num
      return array
    else
      until num >= array[index] && num < array[index + 1]
        index += 1
      end
      array.insert(index + 1, num)
    end
      array
  end

  def sort
    tree_to_array.reduce([]) do |ary, n|
      ary = sorted_insert(n, ary)
    end
  end

  def maximum
    sort[-1]
  end

  def minimum
    sort[0]
  end

  def total
    tree_to_array.count
  end

  def height
    array = []
    tree_to_array.each do |num|
      array << depth_of?(num)
    end
    array.max
  end

  def find_parent_node(value, this_node = @head)
    if (value == this_node.right_node.value) || (value == this_node.left_node.value)
      this_node
    elsif value > this_node.value
      find_parent_node(value, this_node.right_node)
    elsif value < this_node.value
      find_parent_node(value, this_node.left_node)
    end
  end

  def delete(value)
    branch = find_node(value)
    parent_node = find_parent_node(value)
    if parent_node && parent_node.right_node.value == value
      parent_node.right_node = nil
    elsif parent_node && parent_node.left_node.value == value
      parent_node.left_node = nil
    end
    if value == @head.value
      lost_nodes = tree_to_array - [value]
      @head = Node.new(lost_nodes[(lost_nodes.length / 2) - 1])
    else
      lost_nodes = tree_to_array(branch) - [value]
    end
    lost_nodes.each do |node|
      self.insert(node)
    end
  end
  # trying to simplify the clean up the delete method by making the found node not exists
  # def delete(value)
  #   if value == @head.value
  #     lost_nodes = tree_to_array - [value]
  #     @head = Node.new(lost_nodes[(lost_nodes.length / 2) - 1])
  #   else
  #     branch = find_node(value)
  #     lost_nodes = tree_to_array(branch) - [value]
  #     find_node(value)
  #     # binding.pry
  #   end
  #   lost_nodes.each do |node|
  #     insert(node)
  #   end
  # end
end
