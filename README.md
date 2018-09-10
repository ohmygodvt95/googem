![Googem](https://i.imgur.com/OccWajD.jpg)

# Googem

Use stackoverflow.com with commandline interface. No browsers, no graphic interface, only commandline. 
If you want to use a computer professionally, this is the ruby gem for you. LIKE A HACKER.

Rubygems: [Available on the Rubygems.org](https://rubygems.org/gems/googem)

## System required

- Ruby 2.x

## Installation

Ruby environment by RVM

    $ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    $ \curl -sSL https://get.rvm.io | bash -s stable --ruby

Install ***Googem*** yourself as:

    $ gem install googem

## Usage
- Basic command

```bash
$ googem -k "how to publish my ruby gem"
```


- Command and options `$ googem -k "text" -p 1 -s 10`

```bash
Usage: googem [options]
    -v, --version                    Show googem version
    -k, --keyword KEYWORDS           Search by keyword "keywords", eg: $ googem -k "ruby"
    -p, --page [page]                Page number # option
    -s, --size [size]                Size per page # option
    -h, --help                       Show list commands
```

![Demo commandline](https://i.imgur.com/iVlawLz.png)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/googem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Googem project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ohmygodvt95/googem/blob/master/CODE_OF_CONDUCT.md).
