require_relative '../sorting/selection'
require 'test/unit'

class TestSorting < Test::Unit::TestCase

  def setup
    @classes = [
      Selection
    ]
  end

  def test_empty
    @classes.each do |klass|
      subject = klass.send(:new)
      data = []
      assert_equal([], subject.sort(data))
    end
  end

  def test_one_element
    @classes.each do |klass|
      subject = klass.send(:new)
      data = [0]
      assert_equal([0], subject.sort(data))
    end
  end

  def test_equal_elements
    @classes.each do |klass|
      subject = klass.send(:new)
      data = [44, 44, 44]
      assert_equal([44, 44, 44], subject.sort(data))
    end
  end

  def test_two_elements
    @classes.each do |klass|
      subject = klass.send(:new)
      data = [7, 1]
      assert_equal([1, 7], subject.sort(data))
    end
  end

  def test_two_elements_already_sorted
    @classes.each do |klass|
      subject = klass.send(:new)
      data = [1, 7]
      assert_equal([1, 7], subject.sort(data))
    end
  end

  def test_many_negative
    @classes.each do |klass|
      subject = klass.send(:new)
      data = [-1, -770, -567, -4, -45, -9, -5, -23]
      assert_equal([-770, -567, -45, -23, -9, -5, -4, -1], subject.sort(data))
    end
  end

  def test_many_elements
    @classes.each do |klass|
      subject = klass.send(:new)
      data = [1, 0, 7, 8, 66, -7, 5, 54, 0, 3, 1000, 7]
      assert_equal([-7, 0, 0, 1, 3, 5, 7, 7, 8, 54, 66, 1000], subject.sort(data))
    end
  end

end