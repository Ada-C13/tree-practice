class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right
  def initialize(key, val)
    @key = key
    @value = val
    @left, @right = nil, nil
  end
  def inorder_list(list) # (left, root, right)
    list = @left.inorder_list(list) unless @left.nil?
    list << {key: @key, value: @value}
    list = @right.inorder_list(list) unless @right.nil?
    return list
  end
  def preorder_list(list) # (root, left, right)
    list << {key: @key, value: @value}
    list = @left.preorder_list(list) unless @left.nil?
    list = @right.preorder_list(list) unless @right.nil?
    return list
  end
  def postorder_list(list) # (left, right , root)
    list = @left.postorder_list(list) unless @left.nil?
    list = @right.postorder_list(list) unless @right.nil?
    list << {key: @key, value: @value}
    return list
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  # add(value) - adds a value to the Binary Search Tree
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def add(key, value)
    if @root.nil?
      @root = TreeNode.new(key, value)
    else
      add_on_node(@root, key, value)
    end
  end
  def add_on_node(node, key, value)
    if node.nil?
      return TreeNode.new(key, value)
    else
      if node.key > key
        node.left = add_on_node(node.left, key, value)
      else
        node.right = add_on_node(node.right, key, value)
      end
    end
    return node
  end

  # find(value) - returns true if the given value is in the tree and false otherwise.
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find(key)
    node = @root
    until node.nil? do
      if node.key == key
        return node.value
      elsif key < node.key
        node = node.left
      else
        node = node.right
      end
    end
    return nil
  end

  # inorder - returns an array of all the elements in the tree, in order.
  # Time Complexity: O(n) because you visit each node
  # Space Complexity: O(n)
  def inorder
    result = []
    return result if @root.nil?
    return @root.inorder_list(result)
  end

  # preorder - returns an array of all the elements in a preorder fashion (root, left, right).
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    result = []
    return result if @root.nil?
    return @root.preorder_list(result)
  end

  # postorder - returns an array of all the elements in a postorder fashion (left, right , root).
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    result = []
    return result if @root.nil?
    return @root.postorder_list(result)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n) if not balanced
  def height_helper(node)
    return 0 if node.nil?
    if height_helper(node.right) > height_helper(node.left)
      return height_helper(node.right) + 1
    else
      return height_helper(node.left) + 1
    end
  end 
  def height
    return height_helper(@root)
  end
end
