require "pry"

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

  # Time Complexity: O(Log n)
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)
    if !@root
      @root = new_node
      return
    end
    current = @root
    while current != nil
      if key < current.key
        if current.left
          current = current.left
        else
          current.left = new_node
          return
        end
      else
        if current.right
          current = current.right
        else
          current.right = new_node
          return
        end
      end
    end
  end

  # Time Complexity: O(Log n)
  # Space Complexity: O(1)
  def find(key)
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

  # Time Complexity: O(Log n)
  # Space Complexity: O(n)
  def inorder
    ary = []

    def innerfunc(node, ary)
      return if node.nil?
      innerfunc(node.left, ary)
      ary << { :key => node.key, :value => node.value }
      innerfunc(node.right, ary)
    end

    innerfunc(@root, ary)
    return ary
  end

  # Time Complexity: O(Log n)
  # Space Complexity: O(n)
  def preorder
    ary = []

    def innerfunc(node, ary)
      return if node.nil?
      ary << { :key => node.key, :value => node.value }
      innerfunc(node.left, ary)
      innerfunc(node.right, ary)
    end

    innerfunc(@root, ary)
    return ary
  end

  # Time Complexity: O(Log n)
  # Space Complexity: O(n)

  def postorder
    ary = []
    def innerfunc(node, ary)
      return if node.nil?
      innerfunc(node.left, ary)
      innerfunc(node.right, ary)
      ary << { :key => node.key, :value => node.value }
    end

    innerfunc(@root, ary)
    return ary
  end

  # Time Complexity:
  # Space Complexity:
  def height
    def innerfunc(node)
      return 0 if node.nil?
      return 1 if !node.left && !node.right
      return [innerfunc(node.left) + 1, innerfunc(node.right) + 1].max
    end

    return innerfunc(@root)
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
    q = [@root]
    ary = []
    while !q.empty?
      current = q.pop
      q << current.left if current.left
      q << current.right if current.right
      ary << { :key => current.key, :value => current.value }
    end
    return ary
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
