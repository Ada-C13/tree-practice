class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  # Time Complexity: o(log n) if it's balanced; worst case is o(n)  
  # Space Complexity: o(n)
  def add(key, value)
    new_node = TreeNode.new(key, value)
    
    if @root.nil?
      @root = new_node
      return
    end

    return add_helper(@root, new_node)
  end

  def add_helper(current, new_node)
    return new_node if current.nil?

    if new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end
    return current
  end

  # Time Complexity: o(log n) if it's balanced; worst case is o(n)
  # Space Complexity: o(n)
  def find(key)
    return nil if @root.nil?
    return find_helper(@root, key)
  end

  def find_helper(current, key)
    return current.value if current.key == key

    if key <= current.key
      return nil if current.left == nil
      current.left = find_helper(current.left, key)
    else
      return nil if current.right == nil
      current.right = find_helper(current.right, key)
    end

  end

  # Time Complexity: o(n)
  # Space Complexity: o(n)
  def inorder
    return [] if @root.nil?
    result = []
    return inorder_helper(@root, result)
  end

  def inorder_helper(node, result)
    return if node.nil?
  
    if node.left
      inorder_helper(node.left, result) 
    end
    result << { :key => node.key, :value => node.value }
    if node.right
      inorder_helper(node.right, result) 
    end

    return result
  end

  # Time Complexity: o(n)
  # Space Complexity: o(n)
  def preorder
    return [] if @root.nil?
    result = []
    return preorder_helper(@root, result)
  end

  def preorder_helper(node, result)
    return if node.nil?
  
    result << { :key => node.key, :value => node.value }

    if node.left
      preorder_helper(node.left, result) 
    end
    # result << { :key => node.key, :value => node.value }
    if node.right
      preorder_helper(node.right, result) 
    end

    return result
  end

  # Time Complexity: o(n)
  # Space Complexity: o(n)
  def postorder
    return [] if @root.nil?
    result = []
    return postorder_helper(@root, result)
  end

  def postorder_helper(node, result)
    return if node.nil?
  
    if node.left
      postorder_helper(node.left, result) 
    end
    # result << { :key => node.key, :value => node.value }
    if node.right
      postorder_helper(node.right, result) 
    end
    result << { :key => node.key, :value => node.value }

    return result
  end

  # Time Complexity: o(log n)
  # Space Complexity: o(n)
  def height
    return 0 if @root.nil?
    return hegiht_helper(@root)
  end

  def hegiht_helper(node)
    return 0 if node.nil?

    left_tree = hegiht_helper(node.left)
    right_tree = hegiht_helper(node.right)
  
    if left_tree > right_tree
      return left_tree + 1
    else
      return right_tree + 1
    end
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end

# if node.left 
#   inorder_helper(node.left, result)
#   result << node
# end

# if node.right
#   inorder_helper(node.right, result << node.right.value)
# end