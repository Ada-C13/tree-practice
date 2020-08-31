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

  # Time Complexity: 
  # Space Complexity: 
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

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return if !@root
    return @root.value if @root.key == key
    
    if key <= @root.key
      find_helper(key, @root.left)
    else 
      find_helper(key, @root.right)
    end
  end

  def find_helper(key, current)
    return current.value if current.key == key
    if key <= current.key
      find_helper(key, current.left)
    else 
      find_helper(key, current.right)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return [] if !@root
    inorder_helper(@root, @nodes)
    return @nodes
  end

  def inorder_helper(current, nodes)
    return if !current
    # traverse the left subtree
    inorder_helper(current.left, nodes)
    # visit the current node
    nodes.push(
      {
        key: current.key,
        value: current.value
      }
    )
    #traverse the right subtree
    inorder_helper(current.right, nodes)
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return [] if !@root
    preorder_helper(@root, @nodes)
    return @nodes
  end

  def preorder_helper(current, nodes)
    return if !current
    # visit the current node
    nodes.push(
      {
        key: current.key,
        value: current.value
      }
    )
    # traverse the left subtree
    preorder_helper(current.left, nodes)
    #traverse the right subtree
    preorder_helper(current.right, nodes)
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return [] if !@root
    postorder_helper(@root, @nodes)
    return @nodes
  end

  def postorder_helper(current, nodes)
    return if !current
    # traverse the left subtree
    postorder_helper(current.left, nodes)
    #traverse the right subtree
    postorder_helper(current.right, nodes)
    # visit the current node
    nodes.push(
      {
        key: current.key,
        value: current.value
      }
    )
  end

  # Time Complexity: 
  # Space Complexity: 
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
