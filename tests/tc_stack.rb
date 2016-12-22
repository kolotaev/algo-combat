require_relative '../datastructures/stack'
require 'test/unit'

class TestStack < Test::Unit::TestCase

  def setup
    @classes = [StackArray, StackLinkedList]
  end

  def test_size_after_push
    @classes.each do |klass|
      stack = klass.send(:new)
      stack.push 'a'
      stack.push 'b'
      stack.push 'c'
      assert_equal(3, stack.size)
    end
  end

  def test_size_after_pop
    @classes.each do |klass|
      stack = klass.send(:new)
      stack.push 'a'
      stack.push 'b'
      stack.push 'c'
      stack.pop
      stack.pop
      assert_equal(1, stack.size)
    end
  end

  def test_pop_returns_last_inserted
    @classes.each do |klass|
      stack = klass.send(:new)
      stack.push 'a'
      stack.push 'b'
      assert_equal('b', stack.pop)
      stack.push 'c'
      assert_equal('c', stack.pop)
      assert_equal('a', stack.pop)
    end
  end

  def test_pop_returns_nil_if_empty
    @classes.each do |klass|
      stack = klass.send(:new)
      stack.push 'a'
      assert_equal('a', stack.pop)
      assert_nil(stack.pop)
      assert_nil(stack.pop)
      assert_nil(stack.pop)
      assert_nil(stack.pop)
      assert_equal(0, stack.size)
    end
  end

  def test_pop_returns_in_correct_order
    @classes.each do |klass|
      data = []
      stack = klass.send(:new)
      stack.push 'a'
      stack.push 'b'
      stack.push 'c'
      stack.push 'd'
      data << stack.pop
      data << stack.pop
      data << stack.pop
      data << stack.pop
      assert_equal(%w(d c b a), data)
    end
  end

  def test_empty
    @classes.each do |klass|
      stack = klass.send(:new)
      assert(stack.empty?)
      stack.push 'a'
      assert_not_equal(true, stack.empty?)
      stack.push 'b'
      assert_not_equal(true, stack.empty?)
      stack.pop
      stack.pop
      assert(stack.empty?)
      stack.pop
      assert(stack.empty?)
    end
  end

end