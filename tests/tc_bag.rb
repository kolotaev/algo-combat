require_relative '../datastructures/bag'
require 'test/unit'

class TestBag < Test::Unit::TestCase

  def test_size
    bag = Bag.new
    assert_equal(0, bag.size)
    bag.put 'a'
    assert_equal(1, bag.size)
    bag.put 'b'
    bag.put 'c'
    assert_equal(3, bag.size)
  end

  def test_put
    bag = Bag.new
    bag.put 'a'
    assert_equal(1, bag.size)
    assert_equal('a', bag.next)
    bag.put 'b'
    bag.put 'c'
    assert_equal(3, bag.size)
    assert_equal('b', bag.next)
    assert_equal('c', bag.next)
  end

  def test_has_next
    bag = Bag.new
    assert_equal(false, bag.has_next?)
    bag.put 'a'
    assert_equal(true, bag.has_next?)
    assert_equal(true, bag.has_next?)
    bag.next
    has_next = bag.has_next?
    assert_equal(false, has_next)
    bag.put 'a'
    bag.put 'b'
    has_next = bag.has_next?
    assert_equal(true, has_next)
  end

  def test_next
    bag = Bag.new
    data = []
    bag.put 'a'
    bag.put 'b'
    bag.put 'c'
    while bag.has_next?
      data << bag.next
    end
    assert_equal(%w(a b c), data)
  end
end
