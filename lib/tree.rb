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

    if new_node.key <= current.key
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

  #used the following as inspiration for the traversals: http://rubyalgorithms.com/binary_search_tree.html

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    node = @root
    traverse_array = []
    return traverse_array if node.nil?
    
    in_order_helper(node) do |node|
      traverse_array << {:key=> node.key, :value=>node.value}
      # puts node.key
    end

    return traverse_array
  end

  def in_order_helper(node, &block)
    return if node.nil?
    in_order_helper(node.left, &block)
    yield node
    in_order_helper(node.right, &block)
  end

  # Time Complexity: o(n)
  # Space Complexity: O(n^2) 
  def preorder
    node = @root
    traverse_array = []
    return traverse_array if node.nil?
    
    pre_order_helper(node) do |node|
      traverse_array << {:key=> node.key, :value=>node.value}
      # puts node.key
    end

    return traverse_array
  end

  def pre_order_helper(node, &block)
    return if node.nil?

    yield node
    pre_order_helper(node.left, &block)
    pre_order_helper(node.right, &block)
  end

 # Time Complexity: o(n)
  # Space Complexity: O(n^2) 
  def postorder
    node = @root
    traverse_array = []
    return traverse_array if node.nil?
    
    post_order_helper(node) do |node|
      traverse_array << {:key=> node.key, :value=>node.value}
      # puts node.key
    end

    return traverse_array
  end

  def post_order_helper(node, &block)
    return if node.nil?

    post_order_helper(node.left, &block)
    post_order_helper(node.right, &block)
    yield node
  end

  # Time Complexity: o(n)
  # Space Complexity: O(n^2) 
  def height
    count_right = 0
    count_left = 0
    node = @root
    return count_left if node.nil?

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

tree = Tree.new
tree.add(5, "Peter")
tree.add(3, "Paul")
tree.add(1, "Mary")
tree.add(10, "Karla")
tree.add(15, "Ada")
tree.add(25, "Kari")

#     5
#   /  \
#  3   10
# /      \
# 1      15
            #\
            #25
tree.inorder



# balanced = Tree.new
# balanced.add(5, "Peter")
# balanced.add(3, "Paul")
# balanced.add(4, "Kate")
# balanced.add(1, "Mary")
# balanced.add(10, "Karla")
# balanced.add(8, "Ada")
# balanced.add(25, "Kari")

# p balanced.inorder
    