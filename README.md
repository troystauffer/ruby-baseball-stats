# ruby-baseball-stats
A ruby gem that takes a couple CSVs and does a bit of numbers crunching to generate a few statistics.
## tl;dr Version
From terminal:
```
gem install activerecord
gem install sqlite3
gem install bstats
bstats
```
To import new data, run from a directory containing 'Master-small.csv' and 'Batting-07-12.csv' files:
`sudo bstats import`
## How To Install
First, the gem depends on a few other libraries:
* Active Record
* SQLite3
* RSpec (only needed if running the tests from source)

If you already have those, great, just install the gem and go. If not, there's a Gemfile in the source you can use with Bundler to get all the needed dependencies. Alternately, just install the gems individually, that works too.
### Installing The Gem
Just like any other gem:
`sudo gem install bstats`
It's been pushed to RubyGems.org so it's ready and waiting to be pulled down, installed, and run.
## Running The Script
It comes pre-loaded with the stats and players needed to determine the stat winners, so after installing you can just run `bstats` from anywhere and see the results.
### Loading New Data
To load in new player and statistical data, run `sudo bstats import` from a directory containing the 'Master-small.csv' and 'Batting-07-12.csv' files.

## TODO List
* Import needs work:
** Move DB out of /Library/Ruby/Gems into user writable space so that 'sudo' isn't needed to write to it
** Allow more dynamic command line management, like filenames (OptionParser)
* Data model addresses immediate requirements only, could be broken out for more granular and performant data analysis
