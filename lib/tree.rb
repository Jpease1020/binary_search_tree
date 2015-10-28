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

  def include?(value, this_node = @head)
    if value == this_node.value
      true
    elsif (value > this_node.value) && !this_node.right_node
      false
    elsif (value > this_node.value) && this_node.right_node
      include?(value, this_node.right_node)
    elsif value < this_node.value && !this_node.left_node
      false
    elsif value < this_node.value && this_node.left_node
      include?(value, this_node.left_node)
    end
  end

  def depth_of?(value, this_node = @head, counter = 0)
    if include?(value, this_node) == false
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

  def to_array(this_node = @head, array = [])
    if this_node
      array << this_node.value
    end
    if this_node && (this_node.right_node || this_node.left_node)
      to_array(this_node.right_node, array)
      to_array(this_node.left_node, array)
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
    to_array.reduce([]) do |ary, n|
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
    to_array.count
  end
end
