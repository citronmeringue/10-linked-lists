require_relative 'node.rb'
class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    pointer = @head
    if @head == nil
      @head = Node.new(value)
    else
      until pointer.next_node == nil
        pointer = pointer.next_node
      end
      pointer.next_node = Node.new(value)
    end
  end

  def prepend(value)
    pointer = @head
    if pointer.value == nil
      @head = Node.new(value)
    else
      new_head = Node.new(value)
      @head = new_head
      @head.next_node = pointer
    end
  end

  def size
    pointer = @head
    count = 1
    while pointer.next_node != nil
      pointer = pointer.next_node
      count += 1
    end
    count
  end

  def head
    return nil if @head.nil?
    @head.value
  end

  def tail
    pointer = @head
    pointer = pointer.next_node until pointer.next_node == nil
    pointer
  end

  def at(index)
    pointer = @head
    index_pointer = 0
    while index_pointer != index
      pointer = pointer.next_node
      index_pointer += 1
    end
    pointer.value
  end

  def pop
    pointer = @head
    pointer = pointer.next_node until pointer.next_node == tail
    puts "p #{pointer.next_node}"
    pointer.next_node = nil
  end

  def contain?(value)
    pointer = @head
    while pointer.next_node != nil
      if pointer.value == value
        return true
      end

      pointer = pointer.next_node
    end
    if pointer.value == value
      return true
    end
    false
  end

  def find(value)
    pointer = @head
    index = 0
    pointer_init = at(index)
    index_array = []
    if contain?(value)
      until pointer.next_node == nil
        if pointer_init == value
          index_array << index
        end
        pointer = pointer.next_node
        index += 1
        pointer_init = at(index)
      end
      if pointer_init == value
        index_array << index
      end
    end
    index_array
  end

  def to_s
    list_toString = ""
    (0...size).each { |index| list_toString += "(#{at(index)}) -> " }
    list_toString += " nil"
  end
end

list = LinkedList.new()

p list.append(20)
p list.prepend(5)
p list.append(90)
p list.prepend(40)
p list.append(5)
puts "------------------"
p list.contain?(90)
p list.find(5)
puts "----------------"

p list
p list.to_s


#p list.head
