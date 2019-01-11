Simon Tharby's solution to [Linked List](https://www.theodinproject.com/courses/ruby-programming/lessons/linked-lists?ref=lnav) exercise, Odin Project.

You will need two classes:

  * LinkedList class, which will represent the full list.
  * Node class, containing a <code>value</code> method and a link to the <code>next_node</code>, set both as nil by default.

Build the following methods in your linked list class:

  * <code>append</code> adds a new node to the end of the list
  * <code>prepend</code> adds a new node to the start of the list
  * <code>size</code> returns the total number of nodes in the list
  * <code>head</code> returns the first node in the list
  * <code>tail</code> returns the last node in the list
  * <code>at(index)</code> returns the node at the given index
  * <code>pop</code> removes the last element from the list
  * <code>contains?</code> returns true if the passed in value is in the list and otherwise returns false.
  * <code>find(data)</code> returns the index of the node containing data, or nil if not found.
  * <code>to_s</code> represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( data ) -> ( data ) -> ( data ) -> nil

### Extra Credit (Done)

  * <code>insert_at(index)</code> that inserts the node at the given index
  * <code>remove_at(index)</code> that removes the node at the given index. (You will need to update the links of your nodes in the list when you remove a node.)
