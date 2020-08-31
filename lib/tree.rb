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

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def add(key, value)
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
    return current
  end

  # Time Complexity: worst case O(n)
  # Space Complexity: worst case O(n)
  def find(key)
    if @root.nil?
      return nil
    elsif @root.key == key
      return @root.value
    else
      find_helper(@root, key)
    end
  end

  def find_helper(current, key)
    return current.value if current.key == key

    if key <= current.key
      find_helper(current.left, key)
    else
      find_helper(current.right, key)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    inorder_helper(@root, [])
  end

  #Right, Root, Left
  def inorder_helper(current, array)
    return array if current.nil?
    inorder_helper(current.left, array)
    array << { key: current.key, value: current.value }
    inorder_helper(current.right, array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    preorder_helper(@root, [])
  end

  #Root, Left, Right
  def preorder_helper(current, array)
    return array if current.nil?
    array << { key: current.key, value: current.value }
    preorder_helper(current.left, array)
    preorder_helper(current.right, array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    postorder_helper(@root, [])
  end

  #Left, Right, Root
  def postorder_helper(current, array)
    return array if current.nil?

    postorder_helper(current.left, array)
    postorder_helper(current.right, array)
    array << { key: current.key, value: current.value }
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    height_helper(@root, 0)
  end

  def height_helper(current, height)
    if current.nil?
      return height
    else
      height += 1
      left = height_helper(current.left, height)
      right = height_helper(current.right, height)
      if left > right 
        return left
      else
        return right 
      end
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
