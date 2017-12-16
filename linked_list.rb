class Node
  attr_accessor :value, :next_node
  def initialize (value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append node
    if @head == nil
      @head = node
      @tail = node
    else
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = node
      @tail = node
    end
    @size += 1
  end

  def prepend node
    node.next_node = @head
    @head = node
    @size += 1
  end

  def size
    @count
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at index #first element starts at 0
    current_node = @head
    while index > 0
      current_node = current_node.next_node
      index -= 1
    end
    current_node
  end

  def pop
    if @size == 1
      @head = nil
      @tail = nil
    elsif @size > 1
      current_node = @head
      while current_node.next_node != @tail
        current_node = current_node.next_node
      end
      current_node.next_node = nil
      @tail = current_node
    end
    @size -= 1
  end

  def contains? value
    current_node = @head
    while current_node != nil
      if current_node.value == value
        return true
      end
      current_node = current_node.next_node
    end
    false
  end

  def find data
    index = 0
    current_node = @head
    while current_node != nil
      if current_node.value == data
        return index
      end
      index += 1
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    current_node = @head
    puts
    while current_node != nil
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    print "nil\n"
  end

  def insert_at index, data
    current_node = @head
    new_node = Node.new(data)
    if index == 0
      new_node.next_node = current_node
      @head = new_node
    else
      count = 1
      while count != index
        current_node = current_node.next_node
        count += 1
      end
      temp = current_node.next_node
      current_node.next_node = new_node
      new_node.next_node = temp
    end
    @size += 1
  end

  def remove_at index
    current_node = @head
    if index == 0
      @head = current_node.next_node
    else
      count = 1
      while count != index
        current_node = current_node.next_node
        count += 1
      end
      temp = current_node.next_node.next_node
      current_node.next_node = temp
    end
    @size -= 1
  end
end


list = LinkedList.new
node_1 = Node.new(1)
node_2 = Node.new(2)
node_3 = Node.new(3)

list.append(node_1)
list.append(node_2)
list.prepend(node_3)

puts list.size

puts list.head.value
puts list.tail.value
puts list.at(0).value

list.pop
puts list.tail.value

puts list.contains? 5
puts list.contains? 3

puts list.find 2
puts list.find 1

list.insert_at(0, 2)
list.to_s

list.insert_at(2, 2)
list.to_s

list.remove_at(2)
list.to_s
