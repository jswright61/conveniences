require_relative "../test_helper"

class StringExtTest < Minitest::Test
  def test_pluralize_regular
    assert_equal "tasks", "task".pluralize
    assert_equal "projects", "project".pluralize
  end

  def test_pluralize_s_x_z_ch_sh_endings
    assert_equal "boxes", "box".pluralize
    assert_equal "buses", "bus".pluralize
    assert_equal "churches", "church".pluralize
    assert_equal "dishes", "dish".pluralize
  end

  def test_pluralize_consonant_y
    assert_equal "categories", "category".pluralize
  end

  def test_pluralize_vowel_y
    assert_equal "days", "day".pluralize
  end

  def test_camelize_single_word
    assert_equal "Task", "task".camelize
  end

  def test_camelize_snake_case
    assert_equal "MyClassName", "my_class_name".camelize
  end

  def test_camelcase_is_alias_for_camelize
    assert_equal "MyClass".camelize, "my_class".camelcase
  end

  def test_camelize_namespaced_path
    assert_equal "Models::MyClass", "models/my_class".camelize
  end

  def test_titleize_underscored
    assert_equal "My Project", "my_project".titleize
  end

  def test_titleize_spaced
    assert_equal "My Project", "my project".titleize
  end

  def test_constantize_simple
    assert_equal String, "String".constantize
  end

  def test_constantize_namespaced
    assert_equal StringExtTest, "StringExtTest".constantize
  end

  def test_constantize_missing_raises
    assert_raises(NameError) { "NoSuchConstantHere".constantize }
  end
end
