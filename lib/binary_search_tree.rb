# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value, self)
    else
      @root.insert(value)
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value
    if value <= tree_node.value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end
  end

  def delete(value)
    @root = nil if value == @root.value && @root.has_no_children
    node = find(value)
    if node != nil
      if node.left.nil? && node.right.nil?
        node.remove
      elsif node.left.nil? && !node.right.nil?
        node.parent.right = node.right
      elsif !node.left.nil? && node.right.nil?
        node.parent.left = node.left
      else
        max_node = maximum(node.left)
        node.parent.left == node ? node.parent.left = max_node : node.parent.right = max_node
        max_node.parent.left == max_node ? max_node.parent.left = max_node.only_child : max_node.parent.right = max_node.only_child
      end
    end
    node
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right.nil?
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil?
    return 0 if tree_node == @root && tree_node.has_no_children
    return 0 if tree_node.has_no_children
    left_height = 1 + depth(tree_node.left)
    right_height = 1 + depth(tree_node.right)
    left_height > right_height ? left_height : right_height
  end

  def is_balanced?(tree_node = @root)
    return true unless tree_node
    tree_node.left ? left_height = depth(tree_node.left) : left_height = 0
    tree_node.right ? right_height = depth(tree_node.right) : right_height = 0
    if (left_height - right_height).abs <= 1 && is_balanced?(tree_node.right) && is_balanced?(tree_node.left)
      return true
    else
      return false
    end
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr if tree_node.nil?
    in_order_traversal(tree_node.left, arr)
    arr << tree_node.value
    in_order_traversal(tree_node.right, arr)
  end


  private
  # optional helper methods go here:

end
