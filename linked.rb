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

p list
