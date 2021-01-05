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
  def add_helper(current_node, key, value)
    if current_node.nil?
      return TreeNode.new(key, value) 
    end

    if key < current_node.key
      current_node.left = add_helper(current_node.left, key, value)
    else
      current_node.right = add_helper(current_node.right, key, value)
    end
    
    return current_node
  end

  def add(key, value)
    @root = add_helper(@root, key, value)
  end

  # Time Complexity: O(logn)
  # Space Complexity: O(logn)
  def find_helper(current_node, target)
    if current_node == nil
      return current_node 
    end

    if current_node.key == target
      return current_node.value
    end

    if target < current_node.key
      find_helper(current_node.left, target)
    else
      find_helper(current_node.right, target)
    end
  end

  def find(key)
    return find_helper(@root, key)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder_helper(current_node, list)
    if current_node.nil?
      return list 
    end

    inorder_helper(current_node.left, list)
    list << {key: current_node.key, value: current_node.value}
    inorder_helper(current_node.right, list)

    return list
  end

  def inorder
    return inorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder_helper(current_node, list)
    if current_node.nil?
      return list 
    end

    list << {key: current_node.key, value: current_node.value}
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
    
    return list
  end

  def preorder
    return preorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder_helper(current_node, list)
    if current_node.nil?
      return list 
    end
    
    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << {key: current_node.key, value: current_node.value}
    
    return list
  end
  
  def postorder
    return postorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height_helper(current_node)
    if current_node.nil?
      return 0 
    end

    left = height_helper(current_node.left)
    right = height_helper(current_node.right)
    
    if left > right
      return left += 1
    else
      return right += 1
    end
  end

  def height
    if @root.nil?
      return 0 
    end
  
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
