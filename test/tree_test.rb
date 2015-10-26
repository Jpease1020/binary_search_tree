require 'minitest/autorun'
require_relative '../lib/tree'
require_relative '../lib/node'

class TreeTest < Minitest::Test

  def test_the_tree_exists
    tree = BinaryTree.new
    assert tree
  end

  def test_the_tree_has_a_head
    tree = BinaryTree.new(14)
    assert_equal 14, tree.head.value
  end

  def test_we_can_add_a_node_of_larger_value_to_the_right_of_the_head
    tree = BinaryTree.new(14)
    tree.insert(25)
    assert_equal 25, tree.head.right_node.value
  end

  def test_we_can_add_a_node_of_larger_value_to_the_left_of_the_head
    tree = BinaryTree.new(14)
    tree.insert(5)
    assert_equal 5, tree.head.left_node.value
  end

  def test_we_can_add_multiple_nodes_to_the_right
    tree = BinaryTree.new(20)
    tree.insert(25)
    tree.insert(40)
    tree.insert(60)
    assert_equal 25, tree.head.right_node.value
    assert_equal 40, tree.head.right_node.right_node.value
    assert_equal 60, tree.head.right_node.right_node.right_node.value
  end

  def test_we_can_add_multiple_nodes_to_the_left
    tree = BinaryTree.new(50)
    tree.insert(40)
    tree.insert(30)
    tree.insert(20)
    assert_equal 40, tree.head.left_node.value
    assert_equal 30, tree.head.left_node.left_node.value
    assert_equal 20, tree.head.left_node.left_node.left_node.value
  end

  def test_we_can_add_a_left_node_to_the_head_nodes_right_node
    tree = BinaryTree.new(50)
    tree.insert(40)
    tree.insert(45)
    assert_equal 45, tree.head.left_node.right_node.value
  end

  def test_we_can_add_a_right_node_to_the_head_nodes_left_node
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(65)
    assert_equal 65, tree.head.right_node.left_node.value
  end

  def test_we_can_add_a_node_to_the_tree_and_it_goes_in_the_right_place
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(20)
    tree.insert(30)
    tree.insert(40)
    tree.insert(37)
    assert_equal 80, tree.head.right_node.value
    assert_equal 70, tree.head.right_node.left_node.value
    assert_equal 60, tree.head.right_node.left_node.left_node.value
    assert_equal 20, tree.head.left_node.value
    assert_equal 30, tree.head.left_node.right_node.value
    assert_equal 40, tree.head.left_node.right_node.right_node.value
    assert_equal 37, tree.head.left_node.right_node.right_node.left_node.value
  end

end
