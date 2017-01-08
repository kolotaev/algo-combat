require_relative '../sorting/selection'
require_relative '../sorting/insertion'
require_relative '../sorting/shell'
require_relative '../sorting/bubble'
require_relative '../sorting/shaker'
require_relative '../sorting/merge'
require_relative '../sorting/quick'
require 'test/unit'

class TestSorting < Test::Unit::TestCase

  def setup
    @classes = [
      Selection,
      Insertion,
      Shell,
      Bubble,
      Shaker,
      Merge,
      MergeBottomUp,
      Quick,
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

  def test_a_many_elements
    @classes.each do |klass|
      subject = klass.send(:new)
      data = [1, 0, 7, 8, 66, -7, 5, 54, 0, 3, 1000, 7]
      assert_equal([-7, 0, 0, 1, 3, 5, 7, 7, 8, 54, 66, 1000], subject.sort(data))
    end
  end

  def test_worst_case
    @classes.each do |klass|
      subject = klass.send(:new)
      data = *(30.downto(0))
      expected = *(0..30)
      assert_equal(expected, subject.sort(data))
    end
  end

  def test_best_case
    @classes.each do |klass|
      subject = klass.send(:new)
      data = *(0..30)
      expected = *(0..30)
      assert_equal(expected, subject.sort(data))
    end
  end

  def test_partially_sorted_array
    @classes.each do |klass|
      subject = klass.send(:new)
      data = %w(A E E L M O T R X P S) # n of inversions is 6 <= cN
      expected = %w(A E E L M O P R S T X)
      assert_equal(expected, subject.sort(data))
    end
  end

  def test_last_element_affected
    @classes.each do |klass|
      subject = klass.send(:new)
      data = [1, 2, 3, 4, 0]
      assert_equal([0, 1, 2, 3, 4], subject.sort(data))
    end
  end

  def test_first_element_affected
    @classes.each do |klass|
      subject = klass.send(:new)
      data = [7, 1, 2, 3, 4]
      assert_equal([1, 2, 3, 4, 7], subject.sort(data))
    end
  end

  def test_many_same_values
    @classes.each do |klass|
      subject = klass.send(:new)
      data = [0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1]
      assert_equal([0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1], subject.sort(data))
    end
  end

end