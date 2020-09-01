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
    @root = add_helper(@root, key, value)
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    current = @root
    return nil if current.nil?

    until current.key == key
      (current.key > key) ? (current = current.left) : (current = current.right)
    end

    return current.value
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return inorder_helper(@root, [])
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    preorder_helper(@root, [])
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    postorder_helper(@root, [])
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


  ##HELPERS

  def add_helper(node, key, value)
    return TreeNode.new(key, value) if node.nil?

    if key < node.key
      node.left = add_helper(node.left, key, value)
    else
      node.right = add_helper(node.right, key, value)
    end

    return node
  end

  def inorder_helper(current, list)
    return list if current.nil?

    inorder_helper(current.left, list)
    list << { key: current.key, value: current.value}
    inorder_helper(current.right, list)

    return list
  end

  def preorder_helper(current, list)
    return list if current.nil?

    list << {key: current.key, value: current.value}
    preorder_helper(current.left, list)
    preorder_helper(current.right, list)

    return list
  end

  def postorder_helper(current, list)
    return list if current.nil?

    postorder_helper(current.left, list)
    postorder_helper(current.right, list)
    list << {key: current.key, value: current.value}

    return list
  end

  def height_helper(current)
    return 0 if current.nil?

    left = height_helper(current.left)
    right = height_helper(current.right)

    left > right ? (left + 1) : (right + 1)
  end
end
