# create and manipulate linked list (each node holds a reference to the
# next node in the list, or nil if no next node, and to a data value)
# structure: (head-node) -> (node) -> ... (node) -> (tail-node) -> nil

class Node
  attr_accessor :link, :value

  def initialize(value = nil)
    @value = value
    @link = nil
  end
end

class LinkedList
  attr_accessor :size
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.link = node
      @tail = node
    end
    @size += 1
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.link = @head
      @head = node
    end
    @size += 1
  end

  def at(index)
    node = @head
    index >= @size ? node = nil : index.times { node = node.link }
    node
  end

  def pop
    @size -= 1
    @tail = at(@size - 1)
    @tail.link = nil
  end

  def contains?(value)
    find(value) == nil ? false : true
  end

  def find(data)
    node = @head
    result = nil
    index = 0
    until node == nil || result != nil do
      result = index if node.value == data
      node = node.link
      index += 1
    end
    result
  end

  def insert_at(index, data)
    if index <= @size
      node = Node.new(data)
      if index == 0
        prepend(node)
      elsif index == @size
        append(node)
      else
        node.link = at(index)
        at(index - 1).link = node
      end
      @size += 1
    end
  end

  def remove_at(index)
    if index < size
      temp = at(index)
      if index == 0
        @head = at(index + 1)
      elsif index == @size - 1
        @tail = at(index - 1)
        @tail.link = nil
      else
        at(index - 1).link = at(index + 1)
      end
      temp = nil
      @size -= 1
    end
  end

  def to_s
    output = ''
    if @head == nil
      output = 'nil'
    else
      node = @head
      output += "(#{node.value})-> "
      until output.include?('nil') do
        node = node.link
        output += "(#{node.value})-> "
        output += "nil" if node.link == nil
      end
    end
    puts output
  end
end


list = LinkedList.new
list.to_s # => nil

values = ['a', 'b', 'c', 'd', 'e', 'f']
values.each {|e| list.append(Node.new(e))}

list.to_s # => (a)-> (b)-> (c)-> (d)-> (e)-> (f)-> nil
list.prepend(Node.new) # check can add node with @value == nil
list.prepend(Node.new('X'))
list.to_s # => (X)-> ()-> (a)-> (b)-> (c)-> (d)-> (e)-> (f)-> nil
puts "list contains #{list.size} nodes" # => list contains 8 nodes
puts "head node: (#{list.head.value})" # => head node: (X)
puts "tail node: (#{list.tail.value})" # => tail node: (f)
puts "node at index 0: (#{list.at(0).value})" # => node at index 0: (X)
puts "node at index 4: (#{list.at(4).value})" # => node at index 4: (c)
print "node at index 9: "
p list.at(9) # => node at index 9: nil
list.pop
list.to_s # => (X)-> ()-> (a)-> (b)-> (c)-> (d)-> (e)-> nil
puts "tail node: (#{list.tail.value})" # => tail node: (f)
puts "list contains #{list.size} nodes" # => list contains 7 nodes
p list.contains?('b') # => true
p list.contains?('z') # => false
print "index of node with value 'G': "
p list.find('G') # => index of node with value 'G': nil
print "index of node with value 'b': "
p list.find('b') # => index of node with value 'b': 3
list.insert_at(4, 'OoO')
list.to_s # => (X)-> ()-> (a)-> (b)-> (OoO)-> (c)-> (d)-> (e)-> nil
puts "list contains #{list.size} nodes" # => list contains 8 nodes
list.remove_at(4)
list.to_s # => (X)-> ()-> (a)-> (b)-> (c)-> (d)-> (e)-> nil
list.remove_at(6)
list.to_s # => (X)-> ()-> (a)-> (b)-> (c)-> (d)-> nil
puts "list contains #{list.size} nodes" # => list contains 6 nodes
puts "head node: (#{list.head.value})" # => head node: (X)
puts "tail node: (#{list.tail.value})" # => tail node: (d)
