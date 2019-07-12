class Tree
    attr_accessor :payload, :children
  
    def initialize(payload, children)
      @payload = payload
      @children = children
    end
  
end
  
  

class MyQueue
    def initialize
      @queue = []
    end
  
    def enqueue(item)
      @queue.push(item)
    end
  
    def dequeue
      @queue.shift
    end
end

  # Outputs: 1, 2, 3, 4, 5, 6
  def checkInitNode(node, num)
    if node != nil
      puts node.payload
      if node.payload == num.to_i
        puts "Success"
        return true
      end
    end
  end
  


  #search for the given number payload of the tree
  def depthSearch(node, num)

    if (checkInitNode(node, num)) 
      return true
    end

    if node.children != nil
      i = 0
      while node.children[i] != nil  
        if (depthSearch(node.children[i], num.to_i) )
          return true
        end 
        i += 1
      end
    end
  end  
   


  def breadthSearch(node, num)

    if (checkInitNode(node, num)) 
      return true
    end
    
    kids = MyQueue.new

    while  node != nil
      i = 0
      while node.children[i] != nil  

        kids.enqueue(node.children[i])
        puts node.children[i].payload
        if (node.children[i].payload == num.to_i )
          puts "Success"
          return true
        end 
        i += 1
      end
      
      node = kids.dequeue
    end
  end

  # The "Leafs" of a tree, elements that have no children
  deep_fifth_node = Tree.new(5, [])
  eleventh_node = Tree.new(11, [])
  fourth_node   = Tree.new(4, [])
  
  # The "Branches" of the tree
  ninth_node = Tree.new(9, [fourth_node])
  sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
  seventh_node = Tree.new(7, [sixth_node])
  shallow_fifth_node = Tree.new(5, [ninth_node])
  
# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])  

  puts "Enter the number to search"
  num = gets.chomp
  puts "Starting Depth Search:"
  depthSearch(trunk, num)
  puts "Starting Breadth Search:"
  breadthSearch(trunk, num)

  