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
  # Space Complexity: O(log n)
  def add(key, value)
    @root = recursive_add_helper(@root, key, value)
  end

  def recursive_add_helper(node, key, value)
    if node.nil?
      return TreeNode.new(key, value)
    elsif key < node.key
      node.left = recursive_add_helper(node.left, key, value)
    else
      node.right = recursive_add_helper(node.right, key, value)
    end
    return node
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    find_helper(key, @root)
  end

  def find_helper(key, current)
    if current.nil?
      return nil
    end
    if key == current.key
      return current.value
    end
    if current.key > key
      find_helper(key, current.left)
    else
      find_helper(key, current.right)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    nodes_array = []
    inorder_helper(@root, nodes_array)
    return nodes_array
  end

  def inorder_helper(node, nodes_array)
    return if node.nil?
    inorder_helper(node.left, nodes_array)
    nodes_array << {:key => node.key, :value => node.value}
    inorder_helper(node.right, nodes_array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    nodes_array = []
    preorder_helper(@root, nodes_array)
    return nodes_array
  end

  def preorder_helper(node, nodes_array)
    return if node.nil?
    nodes_array << {:key => node.key, :value => node.value}
    preorder_helper(node.left, nodes_array)
    preorder_helper(node.right, nodes_array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    nodes_array = []
    postorder_helper(@root, nodes_array)
    return nodes_array
  end

  def postorder_helper(node, nodes_array)
    return if node.nil?
    postorder_helper(node.left, nodes_array)
    postorder_helper(node.right, nodes_array)
    nodes_array << {:key => node.key, :value => node.value}
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def height
    return height_helper(@root)
  end

  def height_helper(node)
    return 0 if node.nil?
    return 1 + [height_helper(node.left), height_helper(node.right)].max
  end

  # Optional Method
  # Time Complexity: O(n)
  # Space Complexity: O(n) - it will store a half of all nodes count maximum
  def bfs
    return [] if @root.nil?
    queue = [@root]
    nodes_array = []

    while queue.length > 0
      node = queue.shift # take first element, delete it from array
      nodes_array << {:key => node.key, :value => node.value} # add to results
      queue << node.left if node.left # add left node to array if it exists
      queue << node.right if node.right # add right node to array if it exists
    end
    return nodes_array
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
