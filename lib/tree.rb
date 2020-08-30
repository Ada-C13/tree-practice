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
    new_node = TreeNode.new(key,value)
    if @root.nil?
      @root = new_node
    else
      add_node(@root, new_node)
    end
  end

  def add_node(current, new_node)
    return new_node if current.nil?

    if new_node.value <= current.value
      current.left = add_node(current.left, new_node)
    else
      current.right = add_node(current.right, new_node)
    end

    return current
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find(key)
    current = @root
    return nil if current.nil?
    
    until current == nil
      if current.key == key
        return current.value
      elsif key < current.key
        current = current.left
      else
        current = current.right
      end
    end
    return nil
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    traverse_array = []
    return traverse_array if @root.nil?

    in_order_helper(node =@root) do |node|
      traverse_array << {:key=> node.key, :value=>node.value}
    end

    return traverse_array
  end

  def in_order_helper(node, &block)
    in_order_helper(node.left, &block)
    yield node
    in_order_helper(node.right, &block)
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder

  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    raise NotImplementedError
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

tree = Tree.new
tree.add(5, "Peter")
tree.add(3, "Paul")
tree.add(1, "Mary")
tree.add(10, "Karla")
tree.add(15, "Ada")
tree.add(25, "Kari")
p tree 
# tree.inorder

# balanced = Tree.new
# balanced.add(5, "Peter")
# balanced.add(3, "Paul")
# balanced.add(4, "Kate")
# balanced.add(1, "Mary")
# balanced.add(10, "Karla")
# balanced.add(8, "Ada")
# balanced.add(25, "Kari")

# p balanced.inorder
    