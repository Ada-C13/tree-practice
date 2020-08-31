# frozen_string_literal: true

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

  def print_root(node = @root)
    if node.nil?
      puts 'root is niiiiiiiiil'
    else
      puts node.value
      puts node.key
    end
  end

  # def add_recursive(current, key, value)
  #   if current.nil?
  #     current = TreeNode.new(key, value)
  #     return
  #   elsif key < current.key
  #     if current.left =  nil
  #       current.left = TreeNode.new(key, value)
  #     else
  #       add_recursive(current.left, key, value)
  #     end
  #   elsif key >= current.key
  #     if current.right =  nil
  #       current.right = TreeNode.new(key, value)
  #     else
  #       add_recursive(current.right, key, value)
  #     end
  #   end
  # end

  # Time Complexity:
  # Space Complexity:
  def add(key, value)
    current_node = @root

    @root = TreeNode.new(key, value) if current_node.nil?

    until current_node.nil?
      if (key < current_node.key) && current_node.left.nil?
        current_node.left = TreeNode.new(key, value)
      elsif (key > current_node.key) && current_node.right.nil?
        current_node.right = TreeNode.new(key, value)
      elsif key < current_node.key
        current_node = current_node.left
      elsif key > current_node.key
        current_node = current_node.right
      else
        return
      end
    end
  end

  # Time Complexity:
  # Space Complexity:

  def find_recursive(current, key)
    return nil if current.nil?

    return current.value if key == current.key

    if key < current.key
      find_recursive(current.left, key)
    elsif key > current.key
      find_recursive(current.right, key)
    end
  end

  def find(key)
    find_recursive(@root, key)
  end

  # Time Complexity:
  # Space Complexity:

  def inorder_recursion(current, traverse_array)
    return if current.nil?

    inorder_recursion(current.left, traverse_array) # process left side

    traverse_array << { key: current.key, value: current.value }

    inorder_recursion(current.right, traverse_array) # process right side
  end

  def inorder
    traverse_array = []

    inorder_recursion(@root, traverse_array)

    traverse_array
  end

  # Time Complexity:
  # Space Complexity:
  def preorder_recursion(current, traverse_array)
    return if current.nil?

    traverse_array << { key: current.key, value: current.value }
    preorder_recursion(current.left, traverse_array) # process left side
    preorder_recursion(current.right, traverse_array) # process right side
  end

  def preorder
    traverse_array = []

    preorder_recursion(@root, traverse_array)

    traverse_array
  end

  # Time Complexity:
  # Space Complexity:
  def postorder_recursion(current, traverse_array)
    return if current.nil?

    postorder_recursion(current.left, traverse_array) # process left side
    postorder_recursion(current.right, traverse_array) # process right side
    traverse_array << { key: current.key, value: current.value }
  end

  def postorder
    traverse_array = []

    postorder_recursion(@root, traverse_array)

    traverse_array
  end

  # Time Complexity:
  # Space Complexity:

  # def height(node)
  #   return 0 if node.nil?

  #   leftHeight = height(node.left)
  #   return -1 if leftHeight == -1

  #   rightHeight = height(node.right)
  #   return -1 if rightHeight == -1

  #   diff = leftHeight - rightHeight
  #   if diff.abs > 1
  #     -1
  #   else
  #     [leftHeight, rightHeight].max + 1
  #   end
  # end

  # def is_balanced?(node = @root)
  #   check_height(node) != -1
  # end

  def height
    count_right = 0
    count_left = 0
    node = @root
    return count_left if node.nil?

    count_left = height_helper(node, 'left', count_left)
    count_right = height_helper(node, 'right', count_right)
    if count_right > count_left
      count_right
    else
      count_left
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
    inorder.to_s
  end
end
