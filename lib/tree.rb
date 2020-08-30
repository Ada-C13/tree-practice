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
  
  # Time Complexity: O(log n) if balanced and O(n) if not
  # Space Complexity: O(log n) if balanced and O(n) if not
  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  def add_helper(current, key, value)
    # If we are already on nil, just add it here
    if current.nil?
      return TreeNode.new(key, value)
    # Else if the key is less than, boop left 
    elsif key < current.key
      current.left = add_helper(current.left, key, value)
    # Else if the key is less than, boop right 
    elsif key > current.key
      current.right = add_helper(current.right, key, value)
    else
    # Otherwise, we already have this value and we don't need to add it
      raise Exception.new "This value has already been added" 
    end 
    
    return current
  end

  # Time Complexity: O(log n) if balanced and O(n) if not
  # Space Complexity: O(log n) if balanced and O(n) if not
  def find(key)
    # If we are already on nil, just add it here
    return nil if @root.nil?
    #Return the root value if it is the value we are looking for
    return @root.value if @root.key == key
    #Otherwise, call in reinforcements
    return find_helper(@root, key)
  end
  
  def find_helper(current, key)
    # If we are already on nil, just add it here
    return nil if current.nil?
    #if our current is now the same as the key, return it
    return current.value if current.key == key
    #Otherwise, if the key is less than the current key keep on booping left
    if key < current.key
      find_helper(current.left, key)
    #If not, boop right
    else
      find_helper(current.right, key)
    end
  end

  # Time Complexity: O(n) -- because we will always need to go throught ALL nodes
  # Space Complexity: O(n) -- because we will always need to go throught ALL nodes
  def inorder
    #Return an empty array if our root is nil
    return [] if @root == nil
    #Otherwise, call in reinforcements, and tell them where they can put the results
    return inorder_helper(@root, [])
  end

  def inorder_helper(node, list)
    #If where I am is nil return what we already collected
    return list if node.nil?
    #Check the window
    inorder_helper(node.left, list)
    #If it's not nil, add it to the list
    list << {key: node.key, value: node.value}
    #Check the wall
    inorder_helper(node.right, list)
  end

  # Time Complexity: O(n) -- because we will always need to go throught ALL nodes
  # Space Complexity: O(n) -- because we will always need to go throught ALL nodes
  def preorder
    return [] if @root == nil
    return preorder_helper(@root, [])
  end

  def preorder_helper(node, list)
    return list if node.nil?
    #Put your mask on first and THEN check children
    list << {key: node.key, value: node.value}
    preorder_helper(node.left, list)
    preorder_helper(node.right, list)

    return list
  end

  # Time Complexity: O(n) -- because we will always need to go throught ALL nodes
  # Space Complexity: O(n) -- because we will always need to go throught ALL nodes
  def postorder
    return [] if @root == nil
    return postorder_helper(@root, [])
  end

  def postorder_helper(node, list)
    return list if node.nil?
    #Check for children BEFORE running out of the burning building
    postorder_helper(node.left, list)
    postorder_helper(node.right, list)
    list << {key: node.key, value: node.value}
    return list
  end

  # Time Complexity: O(n) -- because we will always need to go throught ALL nodes
  # Space Complexity: O(n) -- because we will always need to go throught ALL nodes
  def height
    return 0 if @root == nil
    return 1 if @root && (@root.left == nil && @root.right == nil)
    height_helper(@root, 0)
  end

  def height_helper(node, count)
    #If where I am is nil return what we already collected
    return count if node.nil?
    #check if the left node is nil, if not add one
    left_count = height_helper(node.left, count + 1)
    #check if the left node is nil, if not add one
    right_count = height_helper(node.right, count + 1)
    #Reveal which twin is the good twin and which is the evil -- only one can survive
    return [left_count, right_count].max
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
