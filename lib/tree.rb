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

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
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

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find(key)
    if @root.nil?
      return nil
    else
      find_helper(@root, key)
    end
  end

  def find_helper(current, key)
    return nil if current.nil?
    if key < current.key
      find_helper(current.left, key)
    elsif key > current.key
      find_helper(current.right, key)
    else
      return current.value
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    result = []
    return inorder_helper(@root, result)
  end

  def inorder_helper(current, result)
    return [] if current.nil?
    # traverse the left subtree
    inorder_helper(current.left, result)
    # visit the current node
    result << {:key=>current.key, :value => current.value}
    # traverse the right subtree
    inorder_helper(current.right, result)
    return result
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    result = []
    preorder_helper(@root, result)
  end

  def preorder_helper(current, result)
    return [] if current.nil?
    # visit the current node
    result << {:key=>current.key, :value => current.value}
    # traverse the left subtree
    preorder_helper(current.left, result)
    # traverse the right subtree
    preorder_helper(current.right, result)
    return result
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    result = []
    return postorder_helper(@root, result)
  end

  def postorder_helper(current, result)
    return [] if current.nil?
    # traverse the left subtree
    postorder_helper(current.left, result)
    # traverse the right subtree
    postorder_helper(current.right, result)
    # visit the current node
    result << {:key=>current.key, :value => current.value}
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return 0 if @root.nil?
    return height_helper(@root)
  end

  def height_helper(current)
    return 0 if current.nil?
    # Otherwise return 1 plus the maximum of the heights of the right and left subtrees
    heights = []
    right_height = height_helper(current.right)
    left_height = height_helper(current.left)
    heights << right_height
    heights << left_height
    return heights.max + 1
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