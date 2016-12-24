# Queue is a data structure that allows putting elements in to a container
# and traverse them.
# There is no possibility to pull any previously put element out.
# 
# Traversing can be used via iterator (while has_next? next)
# 
# Has interface:
# - put
# - next
# - has_next?
# - size
#
# Can have several implementations:
# - Array
# - Linked List
#

# Single-Linked-list implementation of a bag.
class Bag
  attr_reader :size

  def initialize
    @first = @current = {}
    @size = 0
  end

  def put(element)
    old_first = @first
    @first = { data: element, next: {} }
    old_first[:next] = @first
    @size += 1
    @current = @first if size == 1 or @current.empty?
  end

  def next
    data = @current[:data]
    @current = @current[:next]
    data
  end

  def has_next?
    not @current.empty?
  end
end
