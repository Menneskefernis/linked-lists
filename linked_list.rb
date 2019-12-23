require_relative 'node'

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end
  
  def append(value)
    self.size += 1
    new_node = Node.new(value)

    if tail
      self.tail.next_node = new_node
      self.tail = new_node
    else
      self.head = new_node
      self.tail = new_node
    end
  end

  def prepend(value)
    self.size += 1
    new_node = Node.new(value)

    if head
      new_node.next_node = head
      self.head = new_node
    else
      self.head = new_node
      self.tail = new_node
    end
  end

  #def size
    #return 0 unless head
    #
    #count = 1
    #current_node = head
    #
    #while current_node.next_node
    #  count += 1
    #  current_node = current_node.next_node
    #end   
    #count
  #end
  
  def at(index)
    current_node = head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    current_node = head
    
    until current_node.next_node == tail
      current_node = current_node.next_node
    end
    self.tail = current_node
    tail.next_node = nil
    
  end

  def contains?(value)
    current_node = head

    until current_node.nil?
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end
end

list = LinkedList.new
list.append(42)
list.append("John")
list.append("fuck")

puts list.contains?(42)

#list.pop
#puts list.tail.value
#puts list.at(3).value
#puts list.size
#puts list.head.next_node.next_node.value
#puts list.tail.value