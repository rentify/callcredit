# Callcredit

Call Credit API client gem

## Installation

Add this line to your application's Gemfile:

    gem 'callcredit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install callcredit

## Usage

    cc = CallCredit.new

or
    cc = CallCredit.new(:production)

where **:production** is the environment you wish to run it in. (When
no argument is provided, the default environment will be **test**!).

This will read the gem's config file and the appropriate environment
settings.

To perform a search, you'd provide the following information on a
person:

    cc.person(forename: "Julia", surname: "Audi", dob: "1943-03-06")
    cc.address(number: 1, postcode: "X9 9LF")
    cc.search

which will return the results available in the Call Credit database.
