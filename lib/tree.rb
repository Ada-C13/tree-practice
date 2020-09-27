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

  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    new_node = TreeNode.new(key, value)
    @root.nil? ? @root = new_node : comparative_helper(@root, new_node)
  end

  def comparative_helper(current_node, new_node)
    return new_node if current_node.nil?

    if new_node.key <= current_node.key
      current_node.left = comparative_helper(current_node.left, new_node)
    else
      current_node.right = comparative_helper(current_node.right, new_node)
    end

    return current_node
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return nil if @root.nil?
    return @root.value if @root.key == key
    
    current_node = @root

    until current_node == nil 
      return current_node.value if key == current_node.key
      current_node = current_node.left if key < current_node.key
      current_node = current_node.right if key > current_node.key
    end 

  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return [] if @root.nil?
    ordered_list = []
    holder = []
    current_node = @root

    while !current_node.nil? || !holder.empty?
      until current_node.nil? 
        holder << current_node
        current_node = current_node.left 
      end

      current_node = holder.pop
      list_pusher(current_node, ordered_list)
      current_node = current_node.right 
    end

    return ordered_list

  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return [] if @root.nil?
    return preorder_helper(@root, [])
  end

  def preorder_helper(current_node, list)
    return list if current_node.nil?
    
    list_pusher(current_node, list)
    preorder_helper(current_node.left, list)
    preorder_helper(current_node.right, list)
    
    return list
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return [] if @root.nil?
    postorder_helper(@root, [])
  end

  def postorder_helper(current_node, list)
    return list if current_node.nil?
    
    postorder_helper(current_node.left, list)
    postorder_helper(current_node.right, list)
    list_pusher(current_node, list)
    
    return list
  end
  
  def list_pusher(current_node, list)
    list << {key: current_node.key, value: current_node.value}
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    return 0 if @root.nil? 
    height_helper(@root)
  end

  def height_helper(current_node)
    return 0 if current_node.nil? 
    left = height_helper(current_node.left)
    right = height_helper(current_node.right)
    left > right ? (return left + 1) : (return right + 1)
  end


  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
