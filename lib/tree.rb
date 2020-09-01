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

  # Time Complexity: best case O(log n) / worst case O(n)
  # Space Complexity: O(n)
  def add_helper(current, new_node)
    return new_node if current.nil?

    if new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end

    return current
  end

  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end

    return @root
  end

  # Time Complexity: best case O(log n) / worst case O(n)
  # Space Complexity: O(n)
  def find(key)
    current = @root
    return nil if current.nil?

    if current.key == key
      return current.value
    else
      if key < current.key
        return current.left.value
      else
        return current.right.value
      end
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder_helper(current, order)
    if current.nil?
      return
    end

    inorder_helper(current.left, order) if current.left
    order << {key: current.key, value: current.value}
    inorder_helper(current.right, order)  if current.right
  end

  def inorder
    order = []
    inorder_helper(@root, order)
    return order
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder_helper(current, order)
    if current.nil?
      return
    end

    order << {key: current.key, value: current.value}
    preorder_helper(current.left, order) if current.left
    preorder_helper(current.right, order) if current.right
  end

  def preorder
    order = []
    preorder_helper(@root, order)
    return order
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder_helper(current, order)
    if current.nil?
      return
    end

    postorder_helper(current.left, order) if current.left
    postorder_helper(current.right, order) if current.right
    order << {key: current.key, value: current.value}
  end

  def postorder
    order = []
    postorder_helper(@root, order)
    return order
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height_helper(current)
    if current.nil?
      return 0
    else
      return 1 + [height_helper(current.left), height_helper(current.right)].max
    end
  end

  def height
    height_helper(@root)
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

