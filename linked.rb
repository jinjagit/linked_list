class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def to_s
    output = ''
    if @head == nil
      output = 'nil'
    else
      node = @head
      output += "( #{node.value} ) -> "
      while output.include?('nil') == false do
        node = node.link
        output += "( #{node.value} ) -> "
        output += "nil" if node.link == nil
      end
    end
    puts output
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.link = @head
      @head = node
    end
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

list.to_s # => '( f ) -> ( e ) -> ( d ) -> ( c ) -> ( b ) -> ( a ) -> nil'
