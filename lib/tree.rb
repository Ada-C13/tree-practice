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

  # Time Complexity && Space Complexity: O(h) where h is the height of the tree
  # Tree height has a minimum of O(log n) levels. Worst case, an unbalanced tree height is O(n) levels (https://www.cs.cmu.edu/~adamchik/15-121/lectures/Trees/trees.html)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_node
      return 
    end

    add_helper_method(@root, new_node)
  end

  def add_helper_method(current, new_node)
    if new_node.key <= current.key
      if current.left.nil?
        return current.left = new_node
      else
        add_helper_method(current.left, new_node)
      end
    else
      if current.right.nil?
        return current.right = new_node
      else
        add_helper_method(current.right, new_node)
      end
    end 
  end


  # Time Complexity && Space Complexity: O(h) where h is the height of the tree
  # Tree height has a minimum of O(log n) levels. Worst case, an unbalanced tree height is O(n) levels (https://www.cs.cmu.edu/~adamchik/15-121/lectures/Trees/trees.html)
  def find(key)
    return nil if @root.nil?
    current = @root

    while current != nil
      if key == current.key
        return current.value
      elsif key < current.key
        current = current.left
      else
        current = current.right
      end
    end

    return nil
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(h) where h is the height of the tree
  # Space Complexity: In this case, O(n) since I'm building an array
  def inorder
    return [] if @root.nil?
    
    results = []
    inorder_helper(@root, results)
    return results
  end

  def inorder_helper(node, array)
    return if node.nil?
    inorder_helper(node.left, array)
    array << node_reader(node)
    inorder_helper(node.right, array)
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(h) where h is the height of the tree
  # Space Complexity: In this case, O(n) since I'm building an array
  # reference: https://en.wikipedia.org/wiki/Tree_traversal
  def preorder
    return [] if @root.nil?
    
    results = []
    preorder_helper(@root, results)
    return results
  end

  def preorder_helper(node, array)
    return if node.nil?
    array << node_reader(node)
    preorder_helper(node.left, array)
    preorder_helper(node.right, array)
  end

  def node_reader(node)
    return {
      :key => node.key, 
      :value => node.value
    }
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(h) where h is the height of the tree 
  # Space Complexity: In this case, O(n) since I'm building an array
  def postorder
    return [] if @root.nil?
    
    results = []
    postorder_helper(@root, results)
    return results
  end

  def postorder_helper(node, array)
    return if node.nil?
    postorder_helper(node.left, array)
    postorder_helper(node.right, array)
    array << node_reader(node)
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(h) where h is the height of the tree since the recursion maxes out at the height of the tree
  def height
    return height_helper(@root)
  end

  def height_helper(root)
    return 0 if root.nil?

    return find_max(height_helper(root.left), height_helper(root.right)) + 1
  end

  def find_max(a,b)
    a >= b ? a : b
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
