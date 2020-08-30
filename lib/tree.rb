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
    return @root = new_node if @root.nil?
    add_helper(@root, new_node)
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find(key)
    return nil if @root.nil?
    find_helper(@root, key)
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    result = []
    return result if @root.nil?
    inorder_helper(@root, result)
    return result
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    result = []
    return result if @root.nil?
    pre_order_helper(@root, result)
    return result
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    result = []
    return result if @root.nil?
    post_order_helper(@root, result)
    return result
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    return height_helper(@root)
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

  private
  def add_helper(current_node, new_node)
    return new_node if current_node.nil?
    if new_node.key < current_node.key
      current_node.left = add_helper(current_node.left, new_node)
    else 
      current_node.right = add_helper(current_node.right, new_node)
    end
    return current_node # the return value of add_helper for a case when it's not new_node
  end

  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node.value if current_node.key === key

    if key < current_node.key
      current_node.left = find_helper(current_node.left, key)
    else
      current_node.right = find_helper(current_node.right, key)
    end
  end

  def inorder_helper(current_node, arr)
    if current_node.left
      inorder_helper(current_node.left, arr)
    end

    arr << {:key => current_node.key, :value => current_node.value}
    
    if current_node.right
      inorder_helper(current_node.right, arr)
    end

    return current_node
  end

  def pre_order_helper(current_node, arr)
    arr << {:key => current_node.key, :value => current_node.value}
    
    if current_node.left
      pre_order_helper(current_node.left, arr)
    end

    if current_node.right
      pre_order_helper(current_node.right, arr)
    end

    return current_node
  end

  def post_order_helper(current_node, arr)
    if current_node.left
      post_order_helper(current_node.left, arr)
    end
    
    if current_node.right
      post_order_helper(current_node.right, arr)
    end

    arr << {:key => current_node.key, :value => current_node.value}

    return current_node
  end

  def height_helper(current_node)
    return 0 if current_node.nil?
    return 1 + [height_helper(current_node.left), height_helper(current_node.right)].max
  end
end
