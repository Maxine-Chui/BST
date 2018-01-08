
def kth_largest(tree_node, k)
  nodes = reverse_traversal(tree_node)
  return nodes[k-1]
end

def reverse_traversal(tree_node = @root, arr = [])
  return arr if tree_node.nil?
  reverse_traversal(tree_node.right, arr)
  arr << tree_node
  reverse_traversal(tree_node.left, arr)
end
