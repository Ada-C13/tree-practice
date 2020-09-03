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

  # Time Complexity: If the tree is balanced, return O(log n), else return O(n) (n being the tree height)
  # Space Complexity: If the tree is balanced, return O(log n), else return O(n) 
  def add(key, value)
    new_nodelet = TreeNode.new(key, value)

    if @root.nil?
      @root = new_nodelet 
    else 
      @root = add_helper(@root, new_nodelet)
    end 
  end 

  def add_helper(current, new_node)
    return new_node if current.nil?

    if new_node.key < current.key
      current.left = add_helper(current.left, new_node)
    else 
      current.right = add_helper(current.right, new_node)
    end 

    return current 
  end

  # Time Complexity: If the tree is balanced, return O(log n), else return O(n) (n being the tree height)
  # Space Complexity: 
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

  # Time Complexity: O(n) (n being the # of nodes)
  # Space Complexity: O(n) (n being the tree height)
  def inorder
    return [] if @root.nil?

    nodelets_array = []

    inorder_helper(@root, nodelets_array)

    return nodelets_array
  end

  def inorder_helper(nodelet, nodelets_array)
    return if nodelet.nil?

    inorder_helper(nodelet.left, nodelets_array)

    nodelets_array << { key: nodelet.key, value: nodelet.value }

    inorder_helper(nodelet.right, nodelets_array)
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    nodelets_array = []

    preorder_helper(@root, nodelets_array)

    return nodelets_array
  end

  def preorder_helper(nodelet, nodelets_array)
    return if nodelet.nil?

    nodelets_array << {:key => nodelet.key, :value => nodelet.value}

    preorder_helper(nodelet.left, nodelets_array)
    preorder_helper(nodelet.right, nodelets_array)
  end 

  # Time Complexity: O(n), (n being the # of nodes)
  # Space Complexity: O(n), (n being the tree height)
  def postorder
    nodelets_array = []

    postorder_helper(@root, nodelets_array)
    
    return nodelets_array
  end

  def postorder_helper(nodelet, nodelets_array)
    return if nodelet.nil?

    postorder_helper(nodelet.left, nodelets_array)
    postorder_helper(nodelet.right, nodelets_array)

    nodelets_array << {:key => nodelet.key, :value => nodelet.value}
  end 
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return height_helper(@root, 0)
  end

  def height_helper(nodelet, incrementers)
    return incrementers if nodelet.nil?
    
    return [height_helper(nodelet.left, 1 + incrementers), height_helper(nodelet.right, 1 + incrementers)].max
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
