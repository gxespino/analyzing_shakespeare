Analyzing Shakespeare Script
======

## Synopsis
**Analyzing Shakespeare** is a script for parsing Shakespeare plays (in this case Macbeth) and returning the line counts for each character in the play. Thanks to [Upcase](http://upcase.com) for the awesome exercise idea and thanks to [ibiblio](http://ibiblio.org) for the macbeth xml file. 

## How to Run

```
git clone git@github.com:gxespino/analyzing_shakespeare.git
cd analyzing_shakespeare/
ruby macbeth_analyzer.rb
```

## Motivation

My motivation for this project was to use as much of Sandi Metz's POODR philosophy in separating the concerns into separate, distinguishable and modular classes. My second goal was to use a TDD approach as much as possible. I learned about the 'spiking' technique and how it can be useful to learn new gems, nokogiri and net/http, and webmock in this case for me. 

## Installation

1. Clone the project: `$ git clone git@github.com:gxespino/analyzing_shakespeare.git`
2. Enter the project directory: `$ cd analyzing_shakespeare`
3. Bundle: `$ bundle install`
4. Then run the script as above. `$ ruby macbeth_analyzer.rb`

## Tests

Tests are using RSpec and WebMock for the file download. A high level acceptance test is needed as well as general refactoring. 

## What I learned

1. A lot of Ruby headaches involve data manipulation. Be careful and make sure you know whether or not your data is an array, a hash, an array of hashes, etc. 
2. irb is your friend!
3. If you have hashes in an array with the same key and you want to combine their values then: `array.inject { |key, values| key.merge(values) { |x, val_1, val_2 | val_1 + val_2 }}`  This one was tricky!

## To do

1. Refactor
2. Add new tests to fix bug that occurs 1/10 times
3. Rethink naming
4. Add high level acceptance test 

