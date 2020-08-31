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

  # Time Complexity: log(n)
  # Space Complexity: O(1)
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
  # Time Complexity: log(n)
  # Space Complexity: O(1)
  def find(key)
    return find_helper(@root, key)
  end

  def inorder_helper(current)
    result = []
    return [] if current.nil? 
    result += inorder_helper(current.left)
    result.push({:key=>current.key, :value => current.value})
    result += inorder_helper(current.right)
    return result
  end 
  # Time Complexity: log(n)
  # Space Complexity: O(1)
  def inorder
    return inorder_helper(@root)
  end
  
  def preorder_helper(current)
    result = [] 
    return [] if current.nil? 
    result.push({:key=>current.key, :value => current.value})
    result += preorder_helper(current.left)
    result += preorder_helper(current.right)
    return result
  end 
  # Time Complexity: log(n)
  # Space Complexity: O(1)
  def preorder
    return preorder_helper(@root)
  end

  # post_order_helper
  def post_helper(current)
    result = []
    return [] if current.nil? 
    result += post_helper(current.left)
    result += post_helper(current.right)
    result.push({:key=>current.key, :value => current.value})
    return result
  end 

  # Time Complexity: log(n)
  # Space Complexity: O(1)
  def postorder
    return post_helper(@root)
  end

  def height_helper(current)
    num = 0
    left = 0 
    right = 0 
    return 0 if current.nil?
    left += height_helper(current.left)
    right += height_helper(current.right)
    num += 1 

    if left == right 
      return num + right 
    elsif left > right 
      return num + left 
    else   
      return num + right 
    end 

    
  end 
  # Time Complexity: log(n)
  # Space Complexity: O(1)
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
end
