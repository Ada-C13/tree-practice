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
  # Space Complexity: 0(1)
  def add(key, value)
    if @root.nil?
      @root = TreeNode.new(key, value)
      return
    end

    current_node = @root

    while current_node != nil
      if current_node.key < key 
        if current_node.right == nil
          current_node.right = TreeNode.new(key, value)
          return
        end
        current_node = current_node.right 
      else 
        if current_node.left == nil
          current_node.left = TreeNode.new(key, value)
          return 
        end
        current_node = current_node.left
      end
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: 0(1)
  def find(key)
    if @root.nil?
      return nil
    end

    current_node = @root

    while current_node != nil
      if current_node.key == key
        return current_node.value
      elsif current_node.key < key
        current_node = current_node.right
      elsif current_node.key > key
        current_node = current_node.left
      end
    end
    print "No value found"
  end

  # Time Complexity: 0(n)
  # Space Complexity: 0(n) 
  def inorder
    if @root.nil?
      return []
    end
    return inorder_helper(@root, [])
  end
  
  def inorder_helper(current_node, array)
    if current_node.nil?
      return array
    end

    inorder_helper(current_node.left, array) if current_node.left
    array << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, array) if current_node.right
    
    return array
  end

  # Time Complexity: 0(n)
  # Space Complexity: 0(n)
  def preorder
    if @root.nil?
      return []
    else
      return preorder_helper(@root, [])
    end
  end
  
  def preorder_helper(current_node, array)
    if current_node.nil?
      return array
    end
    
    array << {key: current_node.key, value: current_node.value}
    preorder_helper(current_node.left, array)
    preorder_helper(current_node.right, array)
    
    return array
  end

  # Time Complexity: 0(n)
  # Space Complexity: 0(n)
  def postorder
    if @root == nil
      return []
    else
      return postorder_helper(@root, [])
    end
  end
  
  def postorder_helper(current_node, array)
    if current_node.nil?
      return array
    end
    
    postorder_helper(current_node.left, array)
    postorder_helper(current_node.right, array)
    array.push({key: current_node.key, value: current_node.value})
    
    return array
  end

  # Time Complexity: 0(n)
  # Space Complexity: 0(n)
  def height
    if @root.nil?
      return 0
    elsif @root.left.nil? && @root.right.nil?
      return 1
    end
    return height_helper(@root)
  end
  
  def height_helper(current_node)
    if current_node.nil?
      return 0
    end
    
    left = height_helper(current_node.left)
    right = height_helper(current_node.right)
    if left > right
      return left + 1
    else
      return right + 1
    end
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs

  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
