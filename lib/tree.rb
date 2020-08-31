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

# add helper 
  def helper_add(current, new_node)
    return new_node if current.nil? 

    if new_node.key <= current.key 
      current.left = helper_add(current.left , new_node)
    else   
      current.right = helper_add(current.right, new_node)
    end 
    return current
  end 
  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    @root = helper_add(@root, TreeNode.new(key,value))
  end

  # helper method 
  def find_helper(current, key)
    return nil if current.nil? 

    if current.key == key 
      return current.value 
    elsif current.key < key 
      current = current.right 
    else  
      current = current.left 
    end 
    return find_helper(current,key)
  end 
  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return find_helper(@root, key)
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
