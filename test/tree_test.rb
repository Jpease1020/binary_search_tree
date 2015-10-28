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
    tree.insert(30)
    tree.insert(20)
    tree.insert(40)
    tree.insert(37)
    assert_equal 80, tree.head.right_node.value
    assert_equal 70, tree.head.right_node.left_node.value
    assert_equal 60, tree.head.right_node.left_node.left_node.value
    assert_equal 30, tree.head.left_node.value
    assert_equal 20, tree.head.left_node.left_node.value
    assert_equal 40, tree.head.left_node.right_node.value
    assert_equal 37, tree.head.left_node.right_node.left_node.value
  end

  def test_we_can_see_if_a_node_is_included_in_the_tree
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(20)
    tree.insert(30)

    refute tree.include?(93)
    assert tree.include?(30)
  end

  def test_we_can_check_the_depth_of_a_node
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(30)
    tree.insert(20)
    tree.insert(40)
    tree.insert(81)
    tree.insert(82)
    tree.insert(83)
    tree.insert(84)
    tree.insert(85)
    tree.insert(86)

    assert_equal 1, tree.depth_of?(50)
    assert_equal 2, tree.depth_of?(30)
    assert_equal 3, tree.depth_of?(70)
    assert_equal 0, tree.depth_of?(37)
    assert_equal 8, tree.depth_of?(86)
  end

  def test_we_can_sort_the_tree_converting_it_into_a_sorted_array
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(30)
    tree.insert(20)
    tree.insert(40)
    tree.insert(81)
    assert_equal [20, 30, 40, 50, 60, 70, 80, 81], tree.sort
  end

  def test_we_can_find_the_max_value_in_the_tree
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(30)
    tree.insert(20)
    tree.insert(40)
    tree.insert(81)

    assert_equal 81, tree.maximum
  end

  def test_we_can_find_the_max_value_in_the_tree
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(30)
    tree.insert(20)
    tree.insert(40)
    tree.insert(8)

    assert_equal 8, tree.minimum
  end

  def test_we_can_find_the_total_number_of_nodes_in_the_tree
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(30)
    tree.insert(20)
    tree.insert(40)
    tree.insert(8)

    assert_equal 8, tree.total
  end

  def test_we_can_find_the_total_height_of_the_tree
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(30)
    tree.insert(20)
    tree.insert(40)
    tree.insert(8)
    tree.insert(76)
    tree.insert(75)
    tree.insert(64)

    assert_equal 5, tree.height
  end

  def test_we_can_delete_a_node_in_the_tree_and_the_tree_keeps_the_children_of_that_node
skip
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(30)
    tree.insert(20)
    tree.insert(40)
    tree.insert(8)
    tree.insert(76)
    tree.insert(75)
    tree.insert(64)
    assert_equal 5, tree.height
    assert_equal 11, tree.total
    assert tree.include?(40)

    tree.delete(40)
    assert_equal 5, tree.height
    assert_equal 1, tree.total
    refute tree.include?(40)
  end

  def test_we_can_delete_the_head_and_the_tree_restructures_to_keep_the_children_of_that_node
skip
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(30)
    tree.insert(20)
    tree.insert(40)
    tree.insert(8)
    tree.insert(76)
    tree.insert(75)
    tree.insert(64)

    tree.delete(50)
  end

  def test_we_can_find_a_node
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(30)
    tree.insert(20)
    tree.insert(40)
    tree.insert(41)
    tree.insert(76)
    tree.insert(75)
    tree.insert(64)

    assert_equal 40, tree.find_node(40).value
  end

  def test_we_can_find_a_nodes_parent_node
    tree = BinaryTree.new(50)
    tree.insert(80)
    tree.insert(70)
    tree.insert(60)
    tree.insert(30)
    tree.insert(20)
    tree.insert(40)
    tree.insert(41)
    tree.insert(76)
    tree.insert(75)
    tree.insert(64)

    assert_equal 30, tree.find_parent_node(40).value
  end
end
