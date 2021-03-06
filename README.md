# King Of Time

Ruby API library for daily check-in/check-out operation.

- http://www.kingtime.jp/

[![Build Status](https://travis-ci.org/matsubo/king_of_time.svg?branch=master)](https://travis-ci.org/matsubo/king_of_time)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](http://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/gem/v/vcr.svg?style=flat-square)](https://rubygems.org/gems/king_of_time)
[![Code Climate](https://codeclimate.com/github/matsubo/king_of_time/badges/gpa.svg)](https://codeclimate.com/github/matsubo/king_of_time)

## Screenshot

<img width="637" alt="Screenshot_2017_02_19_1_10" src="https://user-images.githubusercontent.com/98103/93198933-9f648780-f788-11ea-82af-409641023aba.png">


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'king_of_time'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install king_of_time

## Usage


```ruby
require 'king_of_time'

king_of_time = KingOfTime.new({
  timerecorder_id: 1111111111,
  employee_id: 2222222222,
  name: '松倉 友樹',
  password: 'your secret password',
})

# check in
king_of_time.check_in

# start break
king_of_time.start_break

# end break
king_of_time.end_break

# check out
king_of_time.check_out
```


## Test


```
% rspec
```

## Future work

- I18n
- Timezone (Currently fixed with +9:00)

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/matsubo/king_of_time.

