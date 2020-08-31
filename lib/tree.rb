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


  ##recursive because i know how to do it this way (source: youtube)
  def add_helper(current, key, value)
    return TreeNode.new(key, value) if current.nil?

    if key < current.key
      current.left = add_helper(current.left, key, value)
    else
      current.right = add_helper(current.right, key, value)
    end
    return current
  end

  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    if current.node.nil?
      return TreeNode.new(key,value)
     elsif current.node == key
       return true
     end
   
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    raise NotImplementedError
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
