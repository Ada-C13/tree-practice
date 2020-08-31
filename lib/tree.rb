class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

   def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
   end

   def inorder_helper(list)
    if left != nil
      list = left.inorder_helper(list)
    end
      list<< {key: key, value: value}
    if right != nil
      list = right.inorder_helper(list) 
    end
    return list 
  end

   def preorder_helper(list)
    list << {value: value, key: key}
    if left != nil
    list = left.preorder_helper(list) 
    end
    if right != nil
    list = right.preorder_helper(list)
    end
    return list
  end

  def postorder_helper(list)
    if !left.nil?
    list = left.postorder_helper(list) 
    end
    if !right.nil?
    list = right.postorder_helper(list) 
    end
    list << {value: value, key: key}
    return list
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

    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end

  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    current = @root

    while current != nil
      if current.key == key
        return current.value
      elsif key <= current.key
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
    list =[]
    if @root.nil? 
      return list
    else 
    return @root.inorder_helper(list)
    end
  end


  # Time Complexity: 
  # Space Complexity: 
  def preorder
    list =[]
    if @root.nil? 
      return list
    else 
    return @root.preorder_helper(list)
    end
  end  

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    list =[]
    if @root.nil? 
      return list
    else 
    return @root.postorder_helper(list)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    height = 0
    current = @root
    return height_helper(current, height)
  end

  def height_helper(current, height)
    if current.nil?
      return height
    else 
      height = 1 + [height_helper(current.left, height),height_helper(current.right, height)].max
    end
    return height
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
   
  def add_helper(current, new_node)

    return new_node if current.nil?
    if new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end
    return current
  end

end
