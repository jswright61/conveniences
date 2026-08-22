require_relative "../test_helper"

class BlankTest < Minitest::Test
  def test_nil_is_blank
    assert_nil nil
    assert nil.blank?
    refute nil.present?
  end

  def test_false_is_blank
    assert false.blank?
  end

  def test_true_is_not_blank
    refute true.blank?
    assert true.present?
  end

  def test_empty_string_is_blank
    assert "".blank?
  end

  def test_whitespace_only_string_is_blank
    assert "   \t\n".blank?
  end

  def test_non_empty_string_is_present
    refute "hi".blank?
    assert "hi".present?
  end

  def test_empty_array_is_blank
    assert [].blank?
  end

  def test_non_empty_array_is_present
    assert [1].present?
  end

  def test_empty_hash_is_blank
    assert({}.blank?)
  end

  def test_non_empty_hash_is_present
    assert({a: 1}.present?)
  end

  def test_zero_is_not_blank
    refute 0.blank?
    assert 0.present?
  end

  def test_arbitrary_object_is_present
    assert Object.new.present?
  end
end
