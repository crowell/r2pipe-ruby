# R2pipe

r2pipe
======

![r2pipe logo](http://lolcathost.org/b/r2pipe.png)

The r2pipe APIs are based on a single r2 primitive found behind `r_core_cmd_str()`
which is a function that accepts a string parameter describing the r2 command to
run and returns a string with the result.

The decision behind this design comes from a series of benchmarks with different
libffi implementations and resulted that using the native API is more complex and
slower than just using raw command strings and parsing the output.

As long as the output can be tricky to parse, it's recommended to use the JSON
output and deserializing them into native language objects which results much more
handy than handling and maintaining internal data structures and pointers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'r2pipe'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install r2pipe

## Usage

make sure that you have [radare2](https://github.com/radare/radare2) in your path.

use like this

```ruby
require 'r2pipe'
puts 'r2pipe ruby api demo'
puts '===================='
r2p = R2Pipe.new '/bin/ls'
puts r2p.cmd 'pi 5'
puts r2p.cmd 'pij 1'
puts r2p.json(r2p.cmd 'pij 1')
puts r2p.cmd 'px 64'
r2p.quit
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/crowell/r2pipe-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
