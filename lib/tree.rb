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

  # Time Complexity: balanced tree: O(log n) & unbalanced tree: O(n) => where n is the number of nodes
  # Space Complexity: balanced tree: O(log n) & unbalanced tree: O(n) => because of the System Stack
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_node 
    else 
      @root = add_helper(@root, new_node)
    end

  end

  # recursive solution
  def add_helper(current, new_node)

    return new_node if current.nil?

    if new_node.key < current.key 
      current.left = add_helper(current.left, new_node)
    else 
      current.right = add_helper(current.right, new_node)
    end

    return current
  end

  # Time Complexity: balanced tree: O(log n) & unbalanced tree: O(n) => where n is the number of nodes
  # Space Complexity: balanced tree: O(log n) & unbalanced tree: O(n) => because of the System Stack
  def find(key)
    return find_helper(@root, key)
  end

  # recursive solution
  def find_helper(current, key)
    return nil if current.nil?

    return current.value if current.key == key

    if key < current.key
      find_helper(current.left, key)
    else 
      find_helper(current.right, key)
    end
  end 

  # Time Complexity: O(n) => because we traverse every node
  # Space Complexity: balanced tree: O(log n) & unbalanced tree: O(n) => because of the System Stack
  # In-Order: Left, Current, Right

  def inorder
    return inorder_helper(@root, [])
  end

  # recursive solution
  def inorder_helper(current, list)
    return list if current.nil?

    # left -> root -> right
    inorder_helper(current.left, list)
    list << {:key => current.key, :value => current.value}
    inorder_helper(current.right, list)

    return list
  end

  # Time Complexity: O(n) => because we traverse every node
  # Space Complexity: balanced tree: O(log n) & unbalanced tree: O(n) => because of the System Stack
  # Pre-Order: Current, Left, Right
  def preorder
    return preorder_helper(@root, [])
  end

  # recursive solution
  def preorder_helper(current, list)
    return list if current.nil?

    # root ->  Left -> Right
    list << {:key => current.key, :value => current.value}
    preorder_helper(current.left, list)
    preorder_helper(current.right, list)

    return list
  end

  # Time Complexity: O(n) => because we traverse every node
  # Space Complexity: balanced tree: O(log n) & unbalanced tree: O(n) => because of the System Stack
  # Post-Order: Left, Right, Current
  def postorder
    return postorder_helper(@root, [])
  end

  # recursive solution
  def postorder_helper(current, list)
    return list if current.nil?

    # Left -> Right -> root
    postorder_helper(current.left, list)
    postorder_helper(current.right, list)
    list << {:key => current.key, :value => current.value}

    return list
  end

  # Time Complexity: O(n) => because we traverse every node
  # Space Complexity: balanced tree: O(log n) & unbalanced tree: O(n) => because of the System Stack
  def height
    return height_helper(@root, 0)
  end

  # recursive solution
  def height_helper(current, count)
    return count if current.nil?

    count += 1

    current_left = height_helper(current.left, count)
    current_right = height_helper(current.right, count)

    return [current_left, current_right].max
  end

  # Optional Method
  # Time Complexity: O(V + E) => Since every vertex and every edge will be checked once
  # Space Complexity: O(V) => reason?

  # (note) Breadth First Traversals which visit each node level, by level and Depth First Traversals which visit a node's children before it's siblings.
  # In a BFS, you first explore all the nodes one step away, then all the nodes two steps away, etc
  def bfs
    return bfs_helper(@root, [])
  end

  def bfs_helper(current, list)
    return list if current.nil?

    queue = [current] # queue: FIFO

    while !queue.empty?
      current = queue.shift # first out (dequeue)

      # first in (enqueue)
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right

      list << {:key => current.key, :value => current.value}
    end

    return list
  end 

  # reference: http://haozeng.github.io/blog/2014/01/05/trees-in-ruby/
  # https://medium.com/@limichelle21/search-algorithms-in-ruby-c3b8c9b70451
  # time complexity referene: https://brilliant.org/wiki/breadth-first-search-bfs/#:~:text=%5B%5D%20Q%3D%5B%5D-,Complexity%20of%20Breadth%20First%20Search,edge%20will%20be%20checked%20once.
  # https://iq.opengenus.org/breadth-first-search/

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end