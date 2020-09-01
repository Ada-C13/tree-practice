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

  # Time Complexity: O(Log n)
  # Space Complexity: O(1)
  def add(key, value)
    # raise NotImplementedError
    new_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end

  end

  def add_helper(current, new_node)
    return new_node if current.nil?

    if new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end

    current
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find(key)
    # raise NotImplementedError
    current = @root
    return nil if current.nil?
    
    if current.key == key
      return current.value
    else
      find_helper(current, key)
    end

  end

  def find_helper(current, key)
    return current.value if key == current.key

    if key <= current.key
      find_helper(current.left, key)
    else
      find_helper(current.right, key)
    end
  end
  
  # Me, Yieni and Haben got together to do the traverse methods.
  # We found this link but worked on it for a few hours to understand
  # http://rubyalgorithms.com/binary_search_tree.html
  # whet &block and yield are doing before using them
  
  # Time Complexity: O(Log n)
  # Space Complexity: O(n)
  def inorder
    # raise NotImplementedError
    root = @root
    traverse_array = []
    return traverse_array if root.nil?

    inorder_helper(root) do |node|
      traverse_array << { key: node.key, value: node.value }
    end

    traverse_array
  end

  # any method in ruby can take a block
  # &block is usuful for sending in the block when we want to pass it on
  # but with yield alone we did not need to pass in the &block into the main
  # inorder_helper method
  # if we want to use block.call(node) we need to pass in &block in the main
  # helper method

  # yield returns the variable - the information back up :)
  
  def inorder_helper(node, &block)
    return if node.nil?

    inorder_helper(node.left, &block)
    yield node
    inorder_helper(node.right, &block)
  end

  # Time Complexity: O(Log n)
  # Space Complexity: O(n)
  def preorder
    # raise NotImplementedError
    root = @root
    traverse_array = []
    return traverse_array if root.nil?

    preorder_helper(root) do |node|
      traverse_array << { key: node.key, value: node.value }
    end

    traverse_array
  end

  def preorder_helper(node, &block)
    return if node.nil?
    
    yield node
    preorder_helper(node.left, &block)
    preorder_helper(node.right, &block)
  end

  # Time Complexity: O(Log n)
  # Space Complexity: O(n)
  def postorder
    # raise NotImplementedError
    root = @root
    traverse_array = []
    return traverse_array if root.nil?

    postorder_helper(root) do |node|
      traverse_array << { key: node.key, value: node.value }
    end

    traverse_array
  end

  def postorder_helper(node, &block)
    return if node.nil?
    
    postorder_helper(node.left, &block)
    postorder_helper(node.right, &block)
    yield node
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    # raise NotImplementedError
    node = @root
    return 0 if node.nil?

    count_right = 0
    count_left = 0
    
    count_left = height_helper(node, 'left', count_left)
    count_right = height_helper(node, 'right', count_right)

    if count_right > count_left
      return count_right
    else
      return count_left
    end
  end
  
  def height_helper(node, side, count)
    return count if node.nil?
    count += 1
    if side == 'left'
      height_helper(node.left, 'left', count)
    else
      height_helper(node.right, 'right', count)
    end
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
