class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.link = node
      @tail = node
    end
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.link = @head
      @head = node
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

class Node
  attr_accessor :link, :value

  def initialize(value)
    @value = value
    @link = nil
  end
end


list = LinkedList.new

values = ['a', 'b', 'c', 'd', 'e', 'f']
values.each {|e| list.append(Node.new(e))}

puts
list.to_s # => '(a)-> (b)-> (c)-> (d)-> (e)-> (f)-> nil'

list.prepend(Node.new('X'))

list.to_s # => '(X)-> (a)-> (b)-> (c)-> (d)-> (e)-> (f)-> nil'
puts
