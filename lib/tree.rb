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
    @inOrderArray = []
  end

  # Time Complexity: log n because it is binary to find where to add the node
  # Space Complexity: O(n) due to recursion
  def add(key, value)
    if @root == nil
      @root = TreeNode.new(key, value)
      return
    end
    
    current = @root
    add_helper(current, key, value)
  end

  def add_helper(current, key, value)
    if current.key >= key
      if current.left
        current = current.left
        add_helper(current, key, value)
      else
        newNode = TreeNode.new(key, value)
        current.left = newNode
      end
    elsif current.key < key

      if current.right
        current = current.right
        add_helper(current, key, value)
      else
        newNode = TreeNode.new(key, value)
        current.right = newNode
      end
    end 
  end

  # Time Complexity: log n due to the binary search
  # Space Complexity: O(n) due to recursion
  def find(key)
    if !@root
      return nil
    end

    current = @root
    return find_helper(current, key)
  end

  def find_helper(current, searchKey)
    if current.key == searchKey
      return current.value
    end

    if current.key > searchKey
      current = current.left
      return find_helper(current, searchKey)
    elsif current.key < searchKey
      current = current.right
      return find_helper(current, searchKey)
    end
  end

  # Time Complexity: O(n) because it has to go through every node.
  # Space Complexity: O(n) due to the recursive stack
  def inorder
    if @root == nil
      return []
    end
   
    current = @root
    getInOrder(current)
    return @inOrderArray
  end

  def getInOrder(node)
    if node.left != nil
      getInOrder(node.left)
    end

    @inOrderArray.push({:key=>node.key, :value=>node.value})

    if node.right != nil
      getInOrder(node.right)
    end
  end

  # Time Complexity: O(n) because it has to go through every node.
  # Space Complexity: O(n) due to the recursive stack
  def preorder
    if @root == nil
      return []
    end
   
    current = @root
    getPreOrder(current)
    return @inOrderArray
  end

  def getPreOrder(node)
    @inOrderArray.push({:key=>node.key, :value=>node.value})

    if node.left != nil
      getPreOrder(node.left)
    end

    if node.right != nil
      getPreOrder(node.right)
    end
  end

  # Time Complexity: O(n) because it has to go through every node.
  # Space Complexity: O(n) due to the recursive stack
  def postorder
    if @root == nil
      return []
    end
   
    current = @root
    getPostOrder(current)
    return @inOrderArray
  end

  def getPostOrder(node)
    
    if node.left != nil
      getPostOrder(node.left)
    end

    if node.right != nil
      getPostOrder(node.right)
    end

    @inOrderArray.push({:key=>node.key, :value=>node.value})
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    if @root == nil
      return 0
    end
   
    current = @root
    height = 1

    # if current.left == nil && current.right == nil
    #   return @count
    # end

    height = getHeight(current, height)
    return height
  end

  def getHeight(node, height)

    left = height
    right = height

    if node.left != nil
      left = getHeight(node.left, height +1)
    end
   
    if node.right != nil
      right = getHeight(node.right, height + 1)
    end

    if left >= right
      return left
    else
      return right
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
