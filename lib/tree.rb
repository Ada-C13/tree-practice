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

  
  #what to do if node is empty, smaller or larger than initial node
  def add_helper(node, key, value)
    #if the node is empty, the create the node with a key, value
    if node.nil?
      node = TreeNode.new(key, value)
      #if the key is less than the node key, then put it to the left side
    elsif key < node.key
      node.left = add_helper(node.left, key, value)
      #if key is larger than the node key, then add it to the right side
    elsif key > node.key
      node.right = add_helper(node.right, key, value)
    end
    return node
  end

  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

#--------------------------------------------------------------------------#
#pretty much copied pattern from above
#what to do if node is empty, return empty
#otherwise if node is not empty, then set it as the key
#if key is less than -> left
#if key is greater than -> right
def find_helper(node, key)
  if node.nil?
    return nil
  elsif node.key == key
    return node.value
  elsif key < node.key
    return find_helper(node.left, key)
  elsif key > node.key
    return find_helper(node.right, key)
  end
end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find(key)
    return find_helper(@root, key)
  end

  #--------------------------------------------------------------------------#
  #use list is a reference to pass
  #check if node is empty, if yes, return the list
  def inorder_helper(node, list) 
    if node.nil?
      return list
    end
    #push key,value
    list.push({key: node.key, value: node.value})
    inorder_helper(node.left, list)
    inorder_helper(node.right, list)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    return inorder_helper(@root, [])
  end

  #--------------------------------------------------------------------------#
  #used same logic as inorder
  #use list is a reference to pass
  #check if node is empty, if yes, return the list
  def preorder_helper(node, list) 
    if node.nil?
      return list 
    end

    #push key,value 
    list.push({key: node.key, value: node.value})
    preorder_helper(node.left, list)
    preorder_helper(node.right, list)
  end
  
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return preorder_helper(@root, [])
  end

  #--------------------------------------------------------------------------#
    #used same logic as inorder
  #use list is a reference to pass
  #check if node is empty, if yes, return the list
  def postorder_helper(node, list)
    if node.nil?
      return list
    end

    list << {key: node.key, value: node.value}
    postorder_helper(node.left, list)
    postorder_helper(node.right, list)
    
  end
  
  # Time Complexity: O(n)
  # Space Complexity: 0(n)
  def postorder
    return postorder_helper(@root, [])
  end

  #--------------------------------------------------------------------------#
  def height_helper(node)
    if node.nil?
      return 0
    end
    left_length = height_helper(node.left)
    right_length = height_helper(node.right)

    if left_length > right_length
      longest_length = left_length
    else
      longest_length = right_length
    end
    longest_length += 1 # Add one for the current node
    return longest_length

  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return height_helper(@root)
  end

  #--------------------------------------------------------------------------#
  #--------------------------------------------------------------------------#

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
