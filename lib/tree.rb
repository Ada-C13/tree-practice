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

  # Time Complexity: O(n)
  # Space Complexity: O(1) 
  def add_help(current, new_node)
    return new_node if current.nil? 

    new_node.key <= current.key ?
      current.left = add_help(current.left , new_node):
      current.right = add_help(current.right, new_node)

    return current
  end 

  def add(key, value)
    @root = add_help(@root, TreeNode.new(key,value))
  end


  # Time Complexity: log(n)
  # Space Complexity: O(1)
  def help_find(current, key)
    return nil if current.nil? 

    if current.key == key 
      return current.value 
    elsif current.key < key 
      current = current.right 
    else  
      current = current.left 
    end 

    return help_find(current,key)
  end 

  def find(key)
    return help_find(@root, key)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def help_inorder(current)
    result = []
    return [] if current.nil? 
    result += help_inorder(current.left)
    result.push({:key=>current.key, :value => current.value})
    result += help_inorder(current.right)
    return result
  end 

  def inorder
    return help_inorder(@root)
  end

  # Time Complexity: log(n)
  # Space Complexity: O(1)
  def help_preorder(current)
    result = [] 
    return [] if current.nil? 
    result.push({:key=>current.key, :value => current.value})
    result += help_preorder(current.left)
    result += help_preorder(current.right)
    return result
  end 

  def preorder
    return help_preorder(@root)
  end

  # Time Complexity: log(n)
  # Space Complexity: O(1) 
  def help_postorder(current)
    result = []
    return [] if current.nil? 
    result += help_postorder(current.left)
    result += help_postorder(current.right)
    result.push({:key=>current.key, :value => current.value})
    return result
  end 

  def postorder
    return help_postorder(@root)
  end

  # Time Complexity: log(n)
  # Space Complexity: O(1)
  def height_helper(current)
    num, left, right = 0, 0, 0
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
