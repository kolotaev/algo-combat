require_relative '../datastructures/queue'
require 'test/unit'

class TestQueue < Test::Unit::TestCase

  def setup
    @classes = [QueueArray, QueueLinkedList]
  end

  def test_size_after_enqueue
    @classes.each do |klass|
      queue = klass.send(:new)
      queue.enqueue 'a'
      queue.enqueue 'b'
      queue.enqueue 'c'
      assert_equal(3, queue.size)
    end
  end

  def test_size_after_dequeue
    @classes.each do |klass|
      queue = klass.send(:new)
      queue.enqueue 'a'
      queue.enqueue 'b'
      queue.enqueue 'c'
      queue.dequeue
      queue.dequeue
      assert_equal(1, queue.size)
    end
  end

  def test_dequeue_returns_last_inserted
    @classes.each do |klass|
      queue = klass.send(:new)
      queue.enqueue 'a'
      queue.enqueue 'b'
      assert_equal('a', queue.dequeue)
      queue.enqueue 'c'
      assert_equal('b', queue.dequeue)
      assert_equal('c', queue.dequeue)
    end
  end

  def test_dequeue_returns_nil_if_empty
    @classes.each do |klass|
      queue = klass.send(:new)
      queue.enqueue 'a'
      assert_equal('a', queue.dequeue)
      assert_nil(queue.dequeue)
      assert_nil(queue.dequeue)
      assert_nil(queue.dequeue)
      assert_nil(queue.dequeue)
      assert_equal(0, queue.size)
    end
  end

  def test_dequeue_returns_in_correct_order
    @classes.each do |klass|
      data = []
      queue = klass.send(:new)
      queue.enqueue 'a'
      queue.enqueue 'b'
      queue.enqueue 'c'
      queue.enqueue 'd'
      data << queue.dequeue
      data << queue.dequeue
      data << queue.dequeue
      data << queue.dequeue
      assert_equal(%w(a b c d), data)
    end
  end

  def test_empty
    @classes.each do |klass|
      queue = klass.send(:new)
      assert(queue.empty?)
      queue.enqueue 'a'
      assert_not_equal(true, queue.empty?)
      queue.enqueue 'b'
      assert_not_equal(true, queue.empty?)
      queue.dequeue
      queue.dequeue
      assert(queue.empty?)
      queue.dequeue
      assert(queue.empty?)
    end
  end

end