# frozen_string_literal: true

class Hash
  def deep_symbolize_keys
    each_with_object({}) do |(key, value), result|
      result[key.respond_to?(:to_sym) ? key.to_sym : key] = Conveniences.deep_symbolize(value)
    end
  end

  def deep_symbolize_keys!
    replace(deep_symbolize_keys)
  end
end

module Conveniences
  def self.deep_symbolize(value)
    case value
    when Hash then value.deep_symbolize_keys
    when Array then value.map { |v| deep_symbolize(v) }
    else value
    end
  end
end
