# Conveniences

A small set of ActiveSupport-style core extensions, with no Rails (or ActiveSupport itself) required. Built to make it easy to pull `activesupport` out of small, non-Rails gems and scripts while keeping the handful of niceties that get reached for constantly.

## Installation

```ruby
# Gemfile
gem "conveniences"
```

```
gem install conveniences
```

## What's included

```ruby
require "conveniences"
```

### `blank?` / `present?`

On `Object`, `NilClass`, `FalseClass`, `TrueClass`, `Numeric`, and `String`.

```ruby
"".blank?           # => true
"  ".blank?         # => true
nil.blank?          # => true
false.blank?        # => true
[].blank?           # => true
{}.blank?           # => true
0.blank?            # => false
"hi".present?       # => true
```

### `Hash#deep_symbolize_keys` / `#deep_symbolize_keys!`

Recurses into nested hashes and arrays.

```ruby
{"a" => {"b" => 1}, "c" => [{"d" => 2}]}.deep_symbolize_keys
# => {a: {b: 1}, c: [{d: 2}]}
```

### String inflections

```ruby
"task".pluralize        # => "tasks"
"box".pluralize         # => "boxes"
"category".pluralize    # => "categories"

"my_class".camelize     # => "MyClass"
"my_class".camelcase    # => "MyClass" (alias)
"models/my_class".camelize # => "Models::MyClass"

"my_project".titleize   # => "My Project"

"Todoist::Task".constantize # => Todoist::Task
```

## What's deliberately not included

Real timezone support. If you need actual IANA timezone conversion, reach for [`tzinfo`](https://rubygems.org/gems/tzinfo) directly — it's the same library ActiveSupport wraps internally, and it has no Rails dependency.

## Development

```
bundle install
rake test
```
