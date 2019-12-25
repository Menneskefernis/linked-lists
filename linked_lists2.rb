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
  # return 0 unless head
  # 
  # count = 1
  # current_node = head
  # 
  # while current_node.next_node
  #   count += 1
  #   current_node = current_node.next_node
  # end   
  # count
  #end
  
  def at(index)    
    current_node = head

    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    self.size -= 1
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

  def find(data)
    current_node = head
    count = 0

    loop do 
      return nil if current_node.nil?
      return count if current_node.value == data
      count +=1
      current_node = current_node.next_node
    end
  end

  def to_s
    current_node = head
    string = ""

    until current_node == tail.next_node
      string << "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    string << "nil"
  end

  def insert_at(value, index)
    self.size += 1
    return self.append(value) if index == self.size - 1
    return self.prepend(value) if index == 0

    new_node = Node.new(value)

    previous_node = self.at(index - 1)
    next_node = self.at(index)
    
    previous_node.next_node = new_node
    new_node.next_node = next_node
  end

  def remove_at(index)
    self.size -= 1
    return self.head = self.at(1) if index == 0
    if index == size
      self.tail = self.at(index - 1)
      tail.next_node = nil
      return
    end

    previous_node = self.at(index - 1)
    next_node = self.at(index + 1)

    previous_node.next_node = next_node
  end
end

list = LinkedList.new
list.append(42)
list.append("John")
list.append("Laila")
list.append("Viggo")
puts list.to_s
list.remove_at(0)
list.insert_at("Emma", 0)
list.append("Johnny")
#list.prepend("Johnny")
puts list.to_s

#list.insert_at(52, 2)
#puts list.tail.value
#puts list.to_s
#list.remove_at(4)
#puts list.to_s
#puts list.size
#puts list.to_s

#list.remove_at(2)
#puts list.at(2).value

#list.insert_at(18, 1)
#puts list.at(1).value
#puts list.at(2).value
#puts list.to_s
#puts list.size

#list.to_s
#puts list.find("fuck")
#puts list.contains?(42)
#list.pop
#puts list.tail.value
#puts list.at(3).value
#puts list.size
#puts list.head.next_node.next_node.value
#puts list.tail.value