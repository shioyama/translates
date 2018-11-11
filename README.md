# Translates

Translates is an extremely minimalist implementation of the [Mobility](https://github.com/shioyama/mobility) translation framework. It is intended to serve as a teaching aid to explain concepts such as [Inversion of Control](https://en.wikipedia.org/wiki/Inversion_of_control) and [Separation of Concerns](https://en.wikipedia.org/wiki/Separation_of_concerns).

Translates is composed of a very small core and some sample backends and plugins you can use to implement storage patterns and access patterns.

## Usage

Extend the `Translates` module in your class and call `translates` with one or more attribute names as well as a backend class and optional array of plugins. You need to explicitly require each backend and plugin you use since they are not autoloaded.

```ruby
require 'translates/column_backend'
require 'translates/fallbacks_plugin'

class Post
  extend Translates
  translates :title, backend: Translates::ColumnBackend, plugins: [Translates::FallbacksPlugin]
end
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
