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

  # Time Complexity: o(n)
  # Space Complexity: o(n)
  def add(key, value)
    current_node = @root

    if current_node == nil
      current_node = TreeNode.new(key, value)
      @root = current_node
    end

    while nil != current_node
      if key < current_node.key && current_node.left == nil
        current_node.left = TreeNode.new(key, value)
      elsif key > current_node.key && current_node.right == nil
        current_node.right = TreeNode.new(key, value)
      elsif key > current_node.key
        current_node = current_node.right
      elsif key < current_node.key
        current_node = current_node.left
      else
        return
      end
    end
  end

  # Time Complexity: o(n)
  # Space Complexity: 0(1)
  def find(key)
    return nil if @root.nil?
    current_node = @root

    return current_node.value if key == current_node.key

    while current_node != key
      if key == current_node.key
        return current_node.value
      elsif key > current_node.key
        current_node = current_node.right
      elsif key < current_node.key
        current_node = current_node.left
      end
    end
  end

# Time Complexity: O(n)
# Space Complexity: O(1)
  # left - Root - Rigth
  def inorder
    inorder_helper(@root, [])
  end

  def inorder_helper(node = @root, list)
    return list if node.nil?
    inorder_helper(node.left, list)
    list << { :key => node.key, :value => node.value }
    inorder_helper(node.right, list)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  # Root - left - Rigth
  def preorder
    return preorder_helper(@root, [])
  end

  def preorder_helper(node = @root, list)
    return list if node.nil?
    list << { :key => node.key, :value => node.value }
    preorder_helper(node.left, list)
    preorder_helper(node.right, list)

  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  # left - Rigth - Root
  def postorder
    return postorder_helper(@root, [])
  end

  def postorder_helper(node = @root, list)
    return list if node.nil?
    postorder_helper(node.left, list)
    postorder_helper(node.right, list)
    list << { :key => node.key, :value => node.value }
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def height
    height_helper(@root) 
  end

  def height_helper(node = @root)
    return 0 if node.nil?
    left_heigth = height_helper(node.left)
    right_heigth = height_helper(node.right)
    left_heigth > right_heigth ? left_heigth + 1 : right_heigth + 1
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

# tree = Tree.new()
# tree.add(5, "Peter")
# tree.add(3, "Paul")
# tree.add(1, "Mary")
# tree.add(10, "Karla")
# tree.add(15, "Ada")
# tree.add(25, "Kari")

# # pp tree

# tree.find(1)
# tree.preorder
