require_relative "node"  # => true
require 'pry'            # => true

class BinaryTree
  attr_accessor :head          # => nil
  def initialize(value = nil)
    @head = Node.new(value)    # => #<Node:0x007fd80c8912a0 @value=50, @left_node=nil, @right_node=nil>
  end                          # => :initialize

  def insert(value, this_node = @head)
    if value > this_node.value && !this_node.right_node    # => true, false, false, false, false, false, false, false, false, false, true, false, false, true, false, false, true, false, false, false, false, false, false, false, true
      this_node.right_node = Node.new(value)               # => #<Node:0x007fd80c890a08 @value=80, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c853450 @value=76, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>
    elsif value > this_node.value && this_node.right_node  # => #<Node:0x007fd80c890a08 @value=80, @left_node=nil, @right_node=nil>, false, #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=nil, @right_node=nil>, @right_node=nil>, false, false, false, false, false, false, false, #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>, @right_node=nil>, @right_node=nil>, false, #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=nil, @right_node=nil>>, @right_node=nil>, false, #<Node:0x007fd80c853450 @value=76, @left_node=nil, @right_node=nil>, false, #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007...
      insert(value, this_node.right_node)                  # => #<Node:0x007fd80c8835b0 @value=70, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c853450 @value=76, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>
    elsif value < this_node.value && !this_node.left_node  # => true, false, true, true, false, true, false, false, false, false, true, false, false
      this_node.left_node = Node.new(value)                # => #<Node:0x007fd80c8835b0 @value=70, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c873958 @value=30, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c8721c0 @value=20, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>
    elsif value < this_node.value && this_node.left_node   # => #<Node:0x007fd80c8835b0 @value=70, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c873958 @value=30, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c873958 @value=30, @left_node=#<Node:0x007fd80c8721c0 @value=20, @left_node=nil, @right_node=nil>, @right_node=nil>, #<Node:0x007fd80c873958 @value=30, @left_node=#<Node:0x007fd80c8721c0 @value=20, @left_node=nil, @right_node=nil>, @right_node=#<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=nil>>, #<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>, @right_node=nil>, #<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=nil, @right_node=nil>>, #<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>, @right_node=#<Node:0...
      insert(value, this_node.left_node)                   # => #<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c8721c0 @value=20, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c853450 @value=76, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>
    end                                                    # => #<Node:0x007fd80c890a08 @value=80, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c8835b0 @value=70, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c8835b0 @value=70, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c873958 @value=30, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c8721c0 @value=20, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c8721c0 @value=20, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>, #<Node:0x007fd80c862798 @value=41, @...
  end                                                      # => :insert

  def include?(value, this_node = @head)
    if value == this_node.value                               # => true, false, true, true, false, false, true, false, true, true, false, false, false, true, false, false, true, false, true, true, false, false, false, false, true, false, false, false, true, false, false, true, false, true, true, false, false, false, true, false, false, true, false, true, true, false, false, false, false, true, false, false, false, true, false, false, true, false, true, true, false, true, true, false, false, true, false, true, true, false, false, false, true, false, false, true, false, true, true, false, false, true, false, true, true, false, false, true
      true                                                    # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
    elsif (value > this_node.value) && !this_node.right_node  # => false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false
      false
    elsif (value > this_node.value) && this_node.right_node   # => #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, @right_node=nil>, #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, @right_node=nil>, false, false, #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=...
      include?(value, this_node.right_node)                   # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
    elsif value < this_node.value && !this_node.left_node     # => false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false
      false
    elsif value < this_node.value && this_node.left_node      # => #<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, #<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, #<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_no...
      include?(value, this_node.left_node)                    # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
    end                                                       # => true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true
  end                                                         # => :include?

  def depth_of?(value, this_node = @head, counter = 0)
    if include?(value, this_node) == false                    # => false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false
      counter = 0
    end                                                       # => nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
    if value == this_node.value                               # => true, false, true, false, false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false, false, false, false, true, false, true, false, false, true, false, false, false, true, false, false, true
      counter += 1                                            # => 1, 2, 3, 4, 5, 4, 5, 2, 3, 4, 3
      return counter                                          # => 1, 2, 3, 4, 5, 4, 5, 2, 3, 4, 3
    elsif (value > this_node.value) && !this_node.right_node  # => false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false
      counter
    elsif (value > this_node.value) && this_node.right_node   # => #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, @right_node=nil>, #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, @right_node=nil>, false, #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @r...
      counter += 1                                            # => 1, 1, 1, 3, 1, 3, 1, 1, 4, 2, 2, 3
      depth_of?(value, this_node.right_node, counter)         # => 2, 3, 4, 4, 5, 5, 4, 5, 5, 3, 4, 4
    elsif value < this_node.value && !this_node.left_node     # => false, false, false, false, false, false, false, false, false, false, false, false, false
      counter
    elsif value < this_node.value && this_node.left_node      # => #<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, #<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, #<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_no...
      counter += 1                                            # => 2, 2, 2, 4, 2, 3, 2, 3, 1, 1, 1, 1, 2
      depth_of?(value, this_node.left_node, counter)          # => 3, 4, 5, 5, 4, 4, 5, 5, 2, 3, 4, 3, 3
    end
  end                                                         # => :depth_of?

  def to_array(this_node = @head, array = [])
    if this_node                                                   # => #<Node:0x007fd80c8912a0 @value=50, @left_node=#<Node:0x007fd80c873958 @value=30, @left_node=#<Node:0x007fd80c8721c0 @value=20, @left_node=nil, @right_node=nil>, @right_node=#<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=#<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>>>, @right_node=#<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, @right_node=nil>>, #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_nod...
      array << this_node.value                                     # => [50], [50, 80], [50, 80, 70], [50, 80, 70, 76], [50, 80, 70, 76, 75], [50, 80, 70, 76, 75, 60], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64, 30], [50, 80, 70, 76, 75, 60, 64, 30, 40], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], [50], [50, 80], [50, 80, 70], [50, 80, 70, 76], [50, 80, 70, 76, 75], [50, 80, 70, 76, 75, 60], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64, 30], [50, 80, 70, 76, 75, 60, 64, 30, 40], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20]
    end                                                            # => [50], [50, 80], nil, [50, 80, 70], [50, 80, 70, 76], nil, [50, 80, 70, 76, 75], [50, 80, 70, 76, 75, 60], [50, 80, 70, 76, 75, 60, 64], nil, [50, 80, 70, 76, 75, 60, 64, 30], [50, 80, 70, 76, 75, 60, 64, 30, 40], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], nil, [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], [50], [50, 80], nil, [50, 80, 70], [50, 80, 70, 76], nil, [50, 80, 70, 76, 75], [50, 80, 70, 76, 75, 60], [50, 80, 70, 76, 75, 60, 64], nil, [50, 80, 70, 76, 75, 60, 64, 30], [50, 80, 70, 76, 75, 60, 64, 30, 40], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], nil, [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20]
    if this_node && (this_node.right_node || this_node.left_node)  # => #<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, @right_node=nil>, #<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, nil, #<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>, #<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, nil,...
      to_array(this_node.right_node, array)                        # => [50, 80], [50, 80, 70, 76], [50, 80, 70, 76, 75], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80], [50, 80, 70, 76], [50, 80, 70, 76, 75], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41]
      to_array(this_node.left_node, array)                         # => [50, 80, 70, 76, 75], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], [50, 80, 70, 76, 75], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20]
    end                                                            # => nil, nil, nil, [50, 80, 70, 76, 75], nil, nil, [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], nil, nil, [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], nil, [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], nil, nil, nil, [50, 80, 70, 76, 75], nil, nil, [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], nil, nil, [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], nil, [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20]
    array                                                          # => [50, 80], [50, 80, 70, 76], [50, 80, 70, 76, 75], [50, 80, 70, 76, 75], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], [50, 80], [50, 80, 70, 76], [50, 80, 70, 76, 75], [50, 80, 70, 76, 75], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20], [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20],...
  end                                                              # => :to_array

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
  end                                                      # => :sorted_insert

  def sort
    to_array.reduce([]) do |ary, n|
      ary = sorted_insert(n, ary)
    end
  end                                # => :sort

  def maximum
    sort[-1]
  end          # => :maximum

  def minimum
    sort[0]
  end          # => :minimum

  def total
    to_array.count  # => 11
  end               # => :total

  def height
    array = []                 # => []
    to_array.each do |num|     # => [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20]
      array << depth_of?(num)  # => [1], [1, 2], [1, 2, 3], [1, 2, 3, 4], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5, 4], [1, 2, 3, 4, 5, 4, 5], [1, 2, 3, 4, 5, 4, 5, 2], [1, 2, 3, 4, 5, 4, 5, 2, 3], [1, 2, 3, 4, 5, 4, 5, 2, 3, 4], [1, 2, 3, 4, 5, 4, 5, 2, 3, 4, 3]
    end                        # => [50, 80, 70, 76, 75, 60, 64, 30, 40, 41, 20]
    array.max                  # => 5
  end                          # => :height

  def find_node(value, this_node = @head)
    if value == this_node.value                           # => false, false, true
      this_node                                           # => #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=#<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>>
    elsif value > this_node.value                         # => false, true
      find_node(value, this_node.right_node)              # => #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=#<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>>
    elsif value < this_node.value && this_node.left_node  # => #<Node:0x007fd80c873958 @value=30, @left_node=#<Node:0x007fd80c8721c0 @value=20, @left_node=nil, @right_node=nil>, @right_node=#<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=#<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>>>
      find_node(value, this_node.left_node)               # => #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=#<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>>
    end                                                   # => #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=#<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>>, #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=#<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>>, #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=#<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>>
  end                                                     # => :find_node

  def find_parent_node(value, this_node = @head)
    if (value == this_node.right_node.value) || (value == this_node.left_node.value)  # => 30
      this_node                                                          # => #<Node:0x007fd80c8912a0 @value=50, @left_node=#<Node:0x007fd80c873958 @value=30, @left_node=#<Node:0x007fd80c8721c0 @value=20, @left_node=nil, @right_node=nil>, @right_node=#<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=#<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>>>, @right_node=#<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, @right_node=nil>>
      # binding.pry
    elsif value > this_node.value
      find_parent_node(value, this_node.right_node)
    elsif value < this_node.value
      find_parent_node(value, this_node.left_node)
    end                                                                  # => #<Node:0x007fd80c8912a0 @value=50, @left_node=#<Node:0x007fd80c873958 @value=30, @left_node=#<Node:0x007fd80c8721c0 @value=20, @left_node=nil, @right_node=nil>, @right_node=#<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=#<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>>>, @right_node=#<Node:0x007fd80c890a08 @value=80, @left_node=#<Node:0x007fd80c8835b0 @value=70, @left_node=#<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=#<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>>, @right_node=#<Node:0x007fd80c853450 @value=76, @left_node=#<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>, @right_node=nil>>, @right_node=nil>>
  end                                                                    # => :find_parent_node

  def delete(value)
    find_node(value)

  end  # => :delete
end    # => :delete

# tree = BinaryTree.new(50)  # => #<BinaryTree:0x007fd80c8912c8 @head=#<Node:0x007fd80c8912a0 @value=50, @left_node=nil, @right_node=nil>>
# tree.insert(80)            # => #<Node:0x007fd80c890a08 @value=80, @left_node=nil, @right_node=nil>
# tree.insert(70)            # => #<Node:0x007fd80c8835b0 @value=70, @left_node=nil, @right_node=nil>
# tree.insert(60)            # => #<Node:0x007fd80c880f90 @value=60, @left_node=nil, @right_node=nil>
# tree.insert(30)            # => #<Node:0x007fd80c873958 @value=30, @left_node=nil, @right_node=nil>
# tree.insert(20)            # => #<Node:0x007fd80c8721c0 @value=20, @left_node=nil, @right_node=nil>
# tree.insert(40)            # => #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=nil>
# tree.insert(41)            # => #<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>
# tree.insert(76)            # => #<Node:0x007fd80c853450 @value=76, @left_node=nil, @right_node=nil>
# tree.insert(75)            # => #<Node:0x007fd80c3373b8 @value=75, @left_node=nil, @right_node=nil>
# tree.insert(64)            # => #<Node:0x007fd80c3262e8 @value=64, @left_node=nil, @right_node=nil>
#
# tree.height                      # => 5
# tree.total                       # => 11
# tree.include?(40)                # => true
# tree.find_node(40)               # => #<Node:0x007fd80c870550 @value=40, @left_node=nil, @right_node=#<Node:0x007fd80c862798 @value=41, @left_node=nil, @right_node=nil>>
# tree.find_parent_node(40).value  # => 50
