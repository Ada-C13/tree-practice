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
    if @root == nil
      @root = new_node
      return new_node
    else
      add_helper(@root, new_node)
    end
  end

  def add_helper(current, new_node)
    if new_node.key <= current.key
      if current.left == nil
        return current.left = new_node
      else
        add_helper(current.left, new_node)
      end
    else
      if current.right == nil
        return current.right = new_node
      else
        add_helper(current.right, new_node)
      end
    end 
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    if @root == nil
      return nil
    elsif @root.key == key
      return @root.value
    else
      current_node = @root
      while current_node != nil
        if key == current_node.key
          return current_node.value
        elsif key <= current_node.key
          current_node = current_node.left
        else
          current_node = current_node.right
        end
      end
    end  
  end



  # Time Complexity: 
  # Space Complexity: 
  def inorder
    ordered_array = []
    if @root != nil
      inorder_helper(@root, ordered_array)
    end
    return ordered_array
  end

  def inorder_helper(node, array)
    return if node.nil?
    inorder_helper(node.left, array)
    array.push({"key": node.key, "value": node.value})
    inorder_helper(node.right, array)
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    preordred_array = []
    if @root != nil
      preorder_helper(@root, preordred_array)
    end
    return preordred_array
  end

  def preorder_helper(node, array)
    return if node.nil?
    array << {key: node.key, value: node.value}

    preorder_helper(node.left, array)
    preorder_helper(node.right, array)
  end




  # Time Complexity: 
  # Space Complexity: 
  def postorder
    preordred_array = []
    if @root != nil
      postorder_helper(@root, preordred_array)
    end
    return preordred_array
  end

  def postorder_helper(node, array)
    return if node.nil?

    postorder_helper(node.left, array)
    postorder_helper(node.right, array)
    array << {key: node.key, value: node.value}
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    count = 0
    if @root != nil
      count = height_helper(@root)
    end
    return count
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
    # raise NotImplementedError
  end

  # Useful for printing
  def to_s
    # return "#{self.inorder}"
  end
end
