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

class Node
  attr_accessor :link, :value

  def initialize(value = nil)
    @value = value
    @link = nil
  end
end


list = LinkedList.new

puts
list.to_s # => 'nil'

values = ['a', 'b', 'c', 'd', 'e', 'f']
values.each {|e| list.append(Node.new(e))}

list.to_s # => '(a)-> (b)-> (c)-> (d)-> (e)-> (f)-> nil'

list.prepend(Node.new) # check can add node with @value == nil
list.prepend(Node.new('X'))

list.to_s # => '(X)-> ()-> (a)-> (b)-> (c)-> (d)-> (e)-> (f)-> nil'
puts "list contains #{list.size} elements" # => 'list contains 8 elements'
puts "head node: (#{list.head.value})" # => 'head node: (X)'
puts "tail node: (#{list.tail.value})" # => 'tail node: (f)'
puts
