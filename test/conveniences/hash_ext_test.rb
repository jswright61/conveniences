require_relative "../test_helper"

class HashExtTest < Minitest::Test
  def test_symbolizes_top_level_keys
    assert_equal({a: 1, b: 2}, {"a" => 1, "b" => 2}.deep_symbolize_keys)
  end

  def test_symbolizes_nested_hash_keys
    result = {"a" => {"b" => {"c" => 1}}}.deep_symbolize_keys
    assert_equal({a: {b: {c: 1}}}, result)
  end

  def test_symbolizes_keys_inside_arrays
    result = {"a" => [{"b" => 1}, {"c" => 2}]}.deep_symbolize_keys
    assert_equal({a: [{b: 1}, {c: 2}]}, result)
  end

  def test_leaves_non_hash_values_alone
    result = {"a" => 1, "b" => "text", "c" => nil}.deep_symbolize_keys
    assert_equal({a: 1, b: "text", c: nil}, result)
  end

  def test_does_not_mutate_original
    original = {"a" => 1}
    original.deep_symbolize_keys
    assert_equal({"a" => 1}, original)
  end

  def test_bang_mutates_in_place
    hash = {"a" => {"b" => 1}}
    hash.deep_symbolize_keys!
    assert_equal({a: {b: 1}}, hash)
  end
end
