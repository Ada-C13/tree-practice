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
  # Space Complexity: O(1)
  def add(key, value)
      # raise NotImplementedError
    # if the root is nil set the root to be a new node with the given value and return the node.
    return @root = TreeNode.new(key, value) if @root.nil?
    current = @root
    while current != nil 
      if key <= current.key 
        if current.left.nil?
          current.left = TreeNode.new(key, value)
          return
        end
        current = current.left
      else
        if current.right.nil?
          current.right = TreeNode.new(key, value)
          return
        end
        current = current.right
      end
    end
  end

  # Time Complexity:  O(log n)
  # Space Complexity: O(1)
  def find(key)
    return nil if @root.nil?
    current = @root
    while current != nil
      if key == current.key
        return current.value
      elsif key > current.key 
        current = current.right
      else
        current = current.left
      end
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  
  def inorder(current = @root, array = [])
    # traverse the left subtree
    # visit the current node
    # traverse the right subtree
    return array if current.nil?
    inorder(current.left, array)
    array << { key: current.key, value: current.value }
    inorder(current.right, array)
    
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder(current = @root, array = [])
    # visit the current node
    # traverse the left subtree
    # traverse the right subtree
    return array if current.nil?
    array << { key: current.key, value: current.value }
    preorder(current.left, array)
    preorder(current.right, array) 
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
    
  def postorder(current = @root, array = [])
    # traverse the left subtree
    # traverse the right subtree
    # visit the current node
    return array if current.nil?
    postorder(current.left, array)
    postorder(current.right, array)
    array << { key: current.key, value: current.value }  
  end
  
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height(current = @root)
    # If the current node is nil return 0
    # Otherwise return 1 plus the maximum of the heights of the right and left subtrees
    return 0 if current.nil?
    left = height(current.left)
    right = height(current.right)
    left >= right ? 1 + left : 1 + right 
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
