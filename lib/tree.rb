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

  # Time Complexity: O(log n), dependent on height/balance of tree
  # Space Complexity: O(log n)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root == nil
      @root = new_node
    else
      add_helper(new_node)
    end
  end

  def add_helper(current = @root, new_node)
    return new_node if current == nil

    if new_node.key < current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node);
    end

    return current
  end

  # Time Complexity: O(log n), dependent on height/balance of tree
  # Space Complexity: O(log n)
  def find(key)
    current = @root
    return nil if current == nil

    while current != nil
      if key < current.key
        current = current.left
      elsif key > current.key
        current = current.right
      else
        return current.value
      end
    end

    return nil # not found
  end

  # Time Complexity: O(n), dependent on height/balance of tree
  # Space Complexity: O(n)
  def inorder
    arr = []
    current = @root

    inorder_helper(arr, current)
  end
  
  def inorder_helper(arr, current)
    return arr if current == nil

    inorder_helper(arr, current.left) # left
    arr << {:key => current.key, :value => current.value} # current
    inorder_helper(arr, current.right) # right

    return arr
  end

  # Time Complexity: O(n), dependent on height/balance of tree
  # Space Complexity: O(n)
  def preorder
    arr = []
    current = @root

    preorder_helper(arr, current)
  end

  def preorder_helper(arr, current)
    return arr if current == nil

    arr << {:key => current.key, :value => current.value} # current
    preorder_helper(arr, current.left) # left
    preorder_helper(arr, current.right) # right

    return arr
  end

  # Time Complexity: O(n), dependent on height/balance of tree
  # Space Complexity: O(n)
  def postorder
    arr = []
    current = @root

    postorder_helper(arr, current)
  end

  def postorder_helper(arr, current)
    return arr if current == nil
    
    postorder_helper(arr, current.left) # left
    postorder_helper(arr, current.right) # right
    arr << {:key => current.key, :value => current.value} # current

    return arr
  end

  # Time Complexity: O(n), dependent on height/balance of tree
  # Space Complexity: O(n)
  def height
    return height_finder(0, current = @root)
  end

  def height_finder(height, current)
    return height if current == nil

    height += 1 

    left = height_finder(height, current.left)
    right = height_finder(height, current.right)

    return left > right ? left : right
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
