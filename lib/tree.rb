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

    if @root.nil?
      @root = new_node
    else 
      add_helper(@root, new_node)
    end 
  end

  def add_helper(current, new_node)
    return new_node if current.nil? # base case

    if new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else 
      current.right = add_helper(current.right, new_node)
    end 

    return current 
  end 

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    current = @root 
    return nil if current.nil? 
    return current.value if key == current.key 

    until current.nil?
      if key == current.key 
        return current.value
      elsif key  < current.key 
        current = current.left 
      elsif key > current.key 
        current = current.right
      end 
    end 

    return nil # case when key not found
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    root = @root
    list = []

    inorder_helper(root, list)

    return list
  end

  def inorder_helper(current_node, list)
    return if current_node.nil?

    inorder_helper(current_node.left, list)
    list << {:key => current_node.key, :value => current_node.value}
    inorder_helper(current_node.right, list)
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    root = @root
    list = []

    preorder_helper(root, list)

    return list
  end

  def preorder_helper(current_node, list)
    return if current_node.nil?

    list << {:key => current_node.key, :value => current_node.value}
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    root = @root
    list = []

    postorder_helper(root, list)

    return list
  end

  def postorder_helper(current_node, list)
    return if current_node.nil?

    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list << {:key => current_node.key, :value => current_node.value}
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(log n) - balanced 
  def height
    current = @root 
    return height_helper(current, 0)
  end

  def height_helper(current_node, height_count)
    return 0 if current_node.nil? 

    left_size = height_helper(current_node.left, height_count+1)
    right_size = height_helper(current_node.right, height_count+1)

    if left_size >= right_size
      return left_size + 1 
    else 
      return right_size + 1
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
