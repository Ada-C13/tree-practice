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
    @nodes = []
  end

  # Time Complexity: O(log n) for balanced trees, O(n) for unbalanced trees; where n is the number of nodes
  # Space Complexity: O(n), where n is the height
  def add(key, value)
    new_node = TreeNode.new(key, value)
    return @root = new_node if !@root
    add_helper(@root, new_node)
  end

  def add_helper(current, new_node)
    if new_node.key <= current.key
      return current.left = new_node if !current.left
      add_helper(current.left, new_node)
    else
      return current.right = new_node if !current.right
      add_helper(current.right, new_node)
    end 
  end

  # Time Complexity: O(log n) for balanced trees, O(n) for unbalanced trees; where n is the number of nodes
  # Space Complexity: O(n), where n is the height
  def find(key, current = @root)
    return if !@root
    return current.value if current.key == key
    
    key <= current.key ? find(key, current.left) : find(key, current.right)
  end

  # Time Complexity: O(n), where n is the number of nodes
  # Space Complexity: O(n), where n is the height
  def inorder
    return @nodes if !@root
    inorder_helper(@root)
    return @nodes
  end

  def inorder_helper(current)
    return if !current
    # traverse the left subtree
    inorder_helper(current.left)
    # visit the current node
    @nodes.push(
      {
        key: current.key,
        value: current.value
      }
    )
    #traverse the right subtree
    inorder_helper(current.right)
  end

  # Time Complexity: O(n), where n is the number of nodes
  # Space Complexity: O(n), where n is the height
  def preorder
    return @nodes if !@root
    preorder_helper(@root)
    return @nodes
  end

  def preorder_helper(current)
    return if !current
    # visit the current node
    @nodes.push(
      {
        key: current.key,
        value: current.value
      }
    )
    # traverse the left subtree
    preorder_helper(current.left)
    #traverse the right subtree
    preorder_helper(current.right)
  end

  # Time Complexity: O(n), where n is the number of nodes
  # Space Complexity: O(n), where n is the height
  def postorder
    return @nodes if !@root
    postorder_helper(@root)
    return @nodes
  end

  def postorder_helper(current)
    return if !current
    # traverse the left subtree
    postorder_helper(current.left)
    #traverse the right subtree
    postorder_helper(current.right)
    # visit the current node
    @nodes.push(
      {
        key: current.key,
        value: current.value
      }
    )
  end

  # Time Complexity: O(n), where n is the number of nodes
  # Space Complexity: O(n), where n is the height
  def height(current = @root, height = 0)
    # If the current node is nil return 0
    return height if !current
    # Otherwise return 1 plus the maximum of the heights of the right and left subtrees
    left = height(current.left, height + 1)
    right = height(current.right, height + 1)
    return left >= right ? left : right
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
