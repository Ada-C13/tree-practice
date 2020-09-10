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
    
  # Time Complexity: worst case unbalanced-O(n), bal-O(log n)
  # Space Complexity: worst case-O(n), bal-O(log n)
    def add(key, value)
      if @root.nil?
        @root = TreeNode.new(key, value)
      else
        self.add_helper(@root, key, value)
      end
    end

    def add_helper(node, new_key, new_value)
      if new_key <= node.key
        node.left.nil? ? node.left = TreeNode.new(new_key, new_value) : add_helper(node.left, new_key, new_value)
      else
        node.right.nil? ? node.right = TreeNode.new(new_key, new_value) : add_helper(node.right, new_key, new_value)
      end
    end
    
  # Time Complexity: unbal-O(n), bal-O(log n)
  # Space Complexity: unbal-O(n), bal-O(log n)
  def find(key, node=@root)
    return nil if @root.nil?

    if key < node.key
      find(key, node.left)
    elsif key > node.key
      find(key, node.right)
    else
      return node.value
    end
  end


  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    return inorder_helper(@root, [])
  end

  def inorder_helper(node, array)
    return array if node.nil?

    inorder_helper(node.left, array)
    array << {:key=>node.key, :value=>node.value}
    inorder_helper(node.right, array)

    return array
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(node, array)
    return [] if node.nil?

    array << {:key=>node.key, :value=>node.value}
    preorder_helper(node.left, array)
    preorder_helper(node.right, array)

    return array
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(node, array)
    return [] if node.nil?

    postorder_helper(node.left, array)
    postorder_helper(node.right, array)
    array << {:key=>node.key, :value=>node.value}

    return array
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def height(node=@root)
    node.nil? ? 0 : (1 + [height(node.right), height(node.left)].max)
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
