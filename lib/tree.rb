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

  def add_helper(current, key)
    if key <= current.key
      return current if current.left.nil?
      add_helper(current.left, key)
    else
      return current if current.right.nil?
      add_helper(current.right, key)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    if @root == nil
      @root = TreeNode.new(key, value)
      return
    end

    node = add_helper(@root, key)
    if key <= node.key
      node.left = TreeNode.new(key, value)
    else
      node.right = TreeNode.new(key, value)
    end
  end

  def find_helper(current, key)
    if key <= current.key
      return current.value if current.key == key
      find_helper(current.left, key)
    elsif key > current.key
      return current.value if current.key == key
      find_helper(current.right, key)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return nil if @root.nil?
    return @root.value if @root.key == key

    current = @root
    find_key = find_helper(current, key)

    return find_key
  end

  # inorder helper
  def traverse_inorder(tree)
    traverse_inorder(tree.left) if tree.left
    @nodes.push({key: tree.key, value: tree.value})
    traverse_inorder(tree.right) if tree.right
  end

  # Time Complexity: 
  # Space Complexity: 
  # left, root, right
  def inorder
    return [] if @root.nil?
    traverse_inorder(@root)
    return @nodes
  end

  # preorder helper
  def traverse_preorder(tree)
    @nodes.push({key: tree.key, value: tree.value})
    traverse_preorder(tree.left) if tree.left
    traverse_preorder(tree.right) if tree.right
  end  

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return [] if @root.nil?
    traverse_preorder(@root)
    return @nodes
  end

  # postorder helper
  def traverse_postorder(tree)
    traverse_postorder(tree.left) if tree.left
    traverse_postorder(tree.right) if tree.right
    @nodes.push({key: tree.key, value: tree.value})
  end  

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return [] if @root.nil?
    traverse_postorder(@root)
    return @nodes
  end

  def height_helper(tree, height)
    return height_helper(tree.left, height) if tree.left
    return height_helper(tree.right, height) if tree.right
    return height + 1
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    return 0 if @root.nil?
    return 1 if (@root.left.nil? && @root.right.nil?)

    left_height = 1
    height_helper(@root.left, 1) if @root.left
    right_height = 1
    height_helper(@root.right, 1) if @root.right

    return left_height >= right_height ? left_height : right_height
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
