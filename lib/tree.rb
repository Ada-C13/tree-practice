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
  # Space Complexity: O(log n)
  def add(key, value)
  #make the current node's left be the result of calling add on root's left.
  #otherwise make node's right be the result of calling add on node's right.
  new_node = TreeNode.new(key, value)
   if @root.nil?  
    @root = new_node
    return new_node
   end 
    add_node(new_node, @root)
  
  end

  def add_node(new_node, current)
    if current.nil? 
      return new_node
    end 

    if new_node.key <= current.key 
      current.left = add_node(new_node, current.left)
    else 
      current.right = add_node(new_node, current.right)
    end
    return current
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    return nil if @root.nil? 

    find_node(key, @root)
  end

  def find_node(key, current)
    return nil if current.nil? 

    if current.key == key 
      return current.value 
    end
    if key <= current.key 
      return find_node(key, current.left)
    else 
      return find_node(key, current.right)
    end  
    
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    #Left, Current, Right
    new_array = Array.new()
    inorder_helper(@root, new_array)
  end

  def inorder_helper(current, array)
    if current.nil? 
      return array 
    end 
    inorder_helper(current.left, array)
    array << { key: current.key, value: current.value }
    inorder_helper(current.right, array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    #Current, Left, Right
    new_array = Array.new()
    preorder_helper(@root, new_array)
  end

  def preorder_helper(current, array)
    if current.nil?
      return array
    end 

    array << { key: current.key, value: current.value }

    preorder_helper(current.left, array)
    preorder_helper(current.right, array)
  end
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    #Left, Right, Current
    new_array = Array.new()
    postorder_helper(@root, new_array)
  end

  def postorder_helper(current, array)
    if current.nil? 
      return array
    end 

    postorder_helper(current.left, array)
    postorder_helper(current.right, array)
    array << { key: current.key, value: current.value }
  end
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return height_helper(@root)
  end

  def height_helper(current, count = 0)
    if current.nil? 
      return count
    end 
    left_heigth = height_helper(current.left, count + 1)
    right_height = height_helper(current.right, count + 1)
    return left_heigth > right_height ? left_heigth : right_height
  end 

end
