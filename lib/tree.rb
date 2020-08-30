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

  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_node
    else
      add_helper(@root, key, value)
    end
  end

  def add_helper(current, key, value)
    return TreeNode.new(key,value) if current.nil?
    
    if key < current.key 
      current.left = add_helper(current.left,  key, value)
    else
      current.right = add_helper(current.right,  key, value)
    end

    return current
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return if @root.nil?

    if @root == key
      return @root.value
    else
      find_helper(@root, key)
    end
  end

  def find_helper(current, key)
    return if current.nil?

    if key < current.key
      current.left = find_helper(current.left, key)
    elsif key > current.key
      current.right = find_helper(current.right, key)
    else 
      return current.value
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(current_node, list)
    return list if current_node.nil?
    # left 
    inorder_helper(current_node.left, list)
    # middle
    list << {key: current_node.key, value: current_node.value}
    # right
    inorder_helper(current_node.right, list)
    
    return list 
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(current_node, list)
    return list if current_node.nil?
    # middle
    list << {key: current_node.key, value: current_node.value}
    # left
    preorder_helper(current_node.left, list)
    #right
    preorder_helper(current_node.right, list)
    
    return list 
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(current_node, list)
    return list if current_node.nil?
    # left
    postorder_helper(current_node.left, list)
    #right
    postorder_helper(current_node.right, list)
    # middle
    list << {key: current_node.key, value: current_node.value}
    
    return list 
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    if @root.nil?
      return 0 
    else
      height_helper(@root)
    end
  end

  def height_helper(current)
    return 0 if current.nil?
    left = height_helper(current.left)
    right = height_helper(current.right)
    
    if (left > right)
      return left + 1
    else
      return right + 1
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
