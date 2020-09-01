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
    if @root == nil
      @root = TreeNode.new(key, value)
      return
    end

    current = @root
    if key <= current.key
      until current.left.nil?
        current = current.left
      end
      current.left = TreeNode.new(key, value)
    elsif key > current.key
      until current.right.nil?
        current = current.right
      end
      current.right = TreeNode.new(key, value)
    end

    return
  end

  # helper method
  def add_node(direction)
    if current.direction.nil?
      current.direction = TreeNode.new(key, value)
    else
      find_nil(direction)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return nil if @root.nil?
    return @root.value if @root.key == key

    current = @root
    find_key = traverse(current, key)

    return find_key
  end

  def traverse(current, key)
    if key < current.key
      current = current.left
      return current.value if current.key == key
      traverse(current, key)
    elsif key > current.key
      current = current.right
      return current.value if current.key == key
      traverse(current, key)
    end
  end

  def traverse_left(tree)
    if tree.left.nil?
      return tree
    else
      traverse_left(tree.left)
    end
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

  # Time Complexity: 
  # Space Complexity: 
  def height
    raise NotImplementedError
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
