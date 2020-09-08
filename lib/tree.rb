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
  def add_recursive(node, key, value)
    return TreeNode.new(key, value) if node.nil?
    if key < node.key
      node.left = add_recursive(node.left, key, value)
    else
      node.right = add_recursive(node.right, key, value)
    end
    return node
  end

  def add(key, value)
    @root = add_recursive(@root, key, value)
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find_recursive(node, key)
    return node.value if node.key == key
    
    if key <= node.key
      node.left = find_recursive(node.left, key)
    else
      node.right  = find_recursive(node.right, key)
    end
  end

  def find(key)
    current = @root
    return nil if !current

    return find_recursive(root, key)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder_recursive(node, list)
    return list if node.nil?
    
    inorder_recursive(node.left, list)
    list << {key: node.key, value: node.value}
    inorder_recursive(node.right, list)
  end

  def inorder
    return inorder_recursive(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder_recursive(node, list)
    return list if node.nil?

    list << {key: node.key, value: node.value}
    preorder_recursive(node.left, list)
    preorder_recursive(node.right, list)
  end

  def preorder
    return preorder_recursive(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder_recursive(node, list)
    return list if node.nil?

    postorder_recursive(node.left, list)
    postorder_recursive(node.right, list)
    list << {key: node.key, value: node.value}
  end
  def postorder
    return postorder_recursive(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n
  def height_recursive(node)
    return 0 if node.nil?

    left = height_recursive(node.left)
    right = height_recursive(node.right)

    if left > right
     height = left
    else
      height = right
    end
    height += 1
    return height
  end

  def height
    return height_recursive(@root)
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
