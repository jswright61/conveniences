# frozen_string_literal: true

class String
  def pluralize
    case self
    when /(s|x|z|ch|sh)\z/i then "#{self}es"
    when /[^aeiou]y\z/i then "#{self[0...-1]}ies"
    else "#{self}s"
    end
  end

  def camelize
    split("/").map do |part|
      part.split("_").map { |word| capitalize_word(word) }.join
    end.join("::")
  end
  alias_method :camelcase, :camelize

  def titleize
    tr("_", " ").split(" ").map { |word| capitalize_word(word) }.join(" ")
  end

  def constantize
    split("::").reject(&:empty?).inject(Object) { |scope, name| scope.const_get(name) }
  end

  private

  def capitalize_word(word)
    word.empty? ? word : word[0].upcase + word[1..]
  end
end
