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
    new_node = TreeNode.new(key, value)

    if @root == nil
      @root = new_node
    else
      add_helper(@root, new_node)
    end

  end

  def add_helper(current, new_node)
    if new_node.key <= current.key
      if current.left.nil?
        return current.left = new_node
      else
        add_helper(current.left, new_node)
      end
    else
      if current.right.nil?
        return current.right = new_node
      else
        add_helper(current.right, new_node)
      end
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    return nil if @root.nil?
    current = @root

    while current != nil
      if key == current.key
        return current.value
      elsif key < current.key
        current = current.left
      else
        current = current.right
      end
    end

    # if not found
    return nil
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    # This method returns an array of all the elements in the tree, in order. (left, root, right)
    inorder_array = []
    inorder_helper(@root, inorder_array)
  end

  def inorder_helper(current, array)
    return array if current.nil?

    inorder_helper(current.left, array)
    array << { key: current.key, value: current.value }
    inorder_helper(current.right, array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    # This method returns an array of all the elements in a preorder fashion (root, left, right).
    preorder_array = []

    preorder_helper(@root, preorder_array)
  end

  def preorder_helper(current, array)
    return array if current.nil?

    array << { key: current.key, value: current.value }
    preorder_helper(current.left, array)
    preorder_helper(current.right, array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    # This method returns an array of all the elements in a postorder fashion (left, right, root).
    postorder_array = []

    postorder_helper(@root, postorder_array)
  end

  def postorder_helper(current, array)
    return array if current.nil?

    postorder_helper(current.left, array)
    postorder_helper(current.right, array)
    array << { key: current.key, value: current.value }
  end

  # Time Complexity: O(n) - worst case for unbalanced, best case O(log n)
  # Space Complexity: O(1)
  def height
    # return 0 if @root == nil

    height_helper(@root)
  end

  def height_helper(current, count = 0)
    return count if current.nil?

    
    left_height = height_helper(current.left, count + 1)
    right_height = height_helper(current.right, count + 1)
    return [left_height, right_height].max

    # return left_height > right_height ? left_height : right_height
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
