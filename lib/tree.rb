class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right
  
  def initialize(key, value)
    @key = key
    @value = value
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end
  
  # Time Complexity: Olog(n) - only need to look at half the tree
  # Space Complexity: O(1)
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
  
  # Time Complexity: Olog(n) - only need to look at half the tree
  # Space Complexity: O(1)
  def find(key)
    return nil if @root.nil?
    return @root.value if @root.key == key
    
    current = @root
    while current != nil
      if key == current.key
        return current.value
      elsif key < current.key
        current = current.left
      elsif key > current.key
        current = current.right
      end
    end
  end
  
  # Time Complexity: O(n) - n is the number of nodes in the tree
  # Space Complexity: O(n) - my thought is that since we're making a list of nodes to return, we'll have that many nodes stored in the list, but since the stack doesn't ever hold something that's also already in the list, there would never be more than n nodes stored at one time..?  Let me know if that's on the right track.
  # left, root, right (me btwn my children)
  def inorder
    return [] if @root.nil?
    list = []
    stack = []
    current = @root
    
    # while current node exists OR the stack is not empty
    while !current.nil? || !stack.empty?
      
      # while current node exists
      while !current.nil?
        # add it to the stack
        stack << current
        # current becomes node to its left and if it is not nil, this loop will continue
        current = current.left
      end
      
      # pop off the last node that was added
      current = stack.pop
      # add it to the list
      list << {key: current.key, value: current.value}
      # traverse to the right
      current = current.right
    end
    
    return list
  end
  
  # Time Complexity: O(n) - n is the number of nodes in the tree
  # Space Complexity: O(n) - same assumption as inorder
  # root, left, right (me before my children)
  def preorder 
    return [] if @root.nil?
    list = []
    stack = []
    current = @root
    
    stack.push(current)
    while !stack.empty?
      current = stack.pop
      list << {key: current.key, value: current.value}
      stack << current.right if current.right
      stack << current.left if current.left
    end
    
    return list
  end
  
  # Time Complexity: O(n) - n is the number of nodes in the tree
  # Space Complexity: O(n) - same assumption as inorder
  # left, right, root (me after my children)
  def postorder 
    return [] if @root.nil?
    
    list = []
    s1 = []
    s2 = []
    current = @root
    
    s1 << current
    while !s1.empty?
      current = s1.pop
      s2 << current
      s1 << current.left if current.left
      s1 << current.right if current.right
    end
    
    while !s2.empty?
      current = s2.pop
      list << {key: current.key, value: current.value}
    end
    
    return list
  end
  
  # Time Complexity: Olog(n) in the best case (e.g. if the tree is balanced), O(n) in the worst case (the tree is unbalanced and essentially a linked list)
  # Space Complexity: O(1)
  def height
    return 0 if @root.nil?
    return height_helper(@root)
  end
  
  def height_helper(current)
    if current.nil?
      return 0
    else
      return 1 + [height_helper(current.left), height_helper(current.right)].max
    end
  end
  
  
  # Optional Method
  # Time Complexity: O(n) - n is number of nodes
  # Space Complexity: O(n) - queue will hold at most the entire tree
  def bfs
    return [] if @root.nil?

    queue = []
    list = []

    queue << @root
    current = @root
    while !queue.empty?
      current = queue[0]
      queue << current.left if !current.left.nil?
      queue << current.right if !current.right.nil?
      node_to_add = queue.shift
      list << {key: node_to_add.key, value: node_to_add.value}
    end
        
    return list
  end
  
  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
