# KeywordFilter

Keyword Filter, use DFA(Deterministic Finite Automaton)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'keyword_filter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install keyword_filter

## Usage

```ruby
KeywordFilter.add('加微信', '加微信好友', '加薇信')
KeywordFilter.dict
#
# {:is_end=>false,
#  "加"=>
#   {:is_end=>false,
#    "微"=>
#     {:is_end=>false,
#      "信"=>{:is_end=>true, "好"=>{:is_end=>false, "友"=>{:is_end=>true}}}},
#    "薇"=>{:is_end=>false, "信"=>{:is_end=>true}}}}

KeywordFilter.filter("加加/-】 微信信")  # => true
KeywordFilter.filtered_words.join      # => '加微信'
KeywordFilter.filtered_words.clear
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/naixspirit/keyword_filter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KeywordFilter project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/naixspirit/keyword_filter/blob/master/CODE_OF_CONDUCT.md).
