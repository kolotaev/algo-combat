require_relative '../datastructures/priority-queue'
require 'test/unit'

class TestPriorityQueue < Test::Unit::TestCase

  def setup
    @queue = PriorityQueue.new
  end

  def test_size_after_initialize
    assert_equal(0, @queue.size)
  end

  def test_size_after_insert
    @queue.insert 'a'
    @queue.insert 'b'
    @queue.insert 'c'
    assert_equal(3, @queue.size)
  end

  def test_size_of_one
    @queue.insert 'a'
    assert_equal(1, @queue.size)
  end

  def test_size_after_delete
    @queue.insert 'a'
    @queue.insert 'b'
    @queue.delete_max
    @queue.delete_max
    assert_equal(0, @queue.size)
    @queue.delete_max
    assert_equal(0, @queue.size)
  end

  def test_size_after_delete_max
    @queue.insert 'a'
    @queue.insert 'b'
    @queue.insert 'c'
    @queue.delete_max
    @queue.delete_max
    assert_equal(1, @queue.size)
  end

  def test_delete_max_returns_maximum_element
    @queue.insert 'b'
    @queue.insert 'x'
    @queue.insert 'g'
    assert_equal('x', @queue.delete_max)
    @queue.insert 'c'
    assert_equal('g', @queue.delete_max)
    assert_equal('c', @queue.delete_max)
  end

  def test_delete_max_returns_maximum_element_for_duplicates
    @queue.insert 'b'
    @queue.insert 'g'
    @queue.insert 'b'
    @queue.insert 'g'
    @queue.insert 'r'
    assert_equal('r', @queue.delete_max)
    assert_equal('g', @queue.delete_max)
    assert_equal('g', @queue.delete_max)
    assert_equal('b', @queue.delete_max)
    assert_equal('b', @queue.delete_max)
  end

  def test_delete_max_returns_maximum_for_three_elements
    @queue.insert 'f'
    @queue.insert 'x'
    @queue.insert 'z'
    assert_equal('z', @queue.delete_max)
    assert_equal('x', @queue.delete_max)
    assert_equal('f', @queue.delete_max)
  end

  def test_delete_max_returns_nil_if_empty
    @queue.insert 'a'
    assert_equal('a', @queue.delete_max)
    assert_nil(@queue.delete_max)
    assert_nil(@queue.delete_max)
    assert_nil(@queue.delete_max)
    assert_nil(@queue.delete_max)
    assert_equal(0, @queue.size)
  end

  def test_empty
    assert(@queue.empty?)
    @queue.insert 'a'
    assert_not_equal(true, @queue.empty?)
    @queue.insert 'b'
    assert_not_equal(true, @queue.empty?)
    @queue.delete_max
    @queue.delete_max
    assert(@queue.empty?)
    @queue.delete_max
    assert(@queue.empty?)
  end

end