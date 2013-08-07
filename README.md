# Callcredit

Call Credit API client gem

## Installation

Add this line to your application's Gemfile:

    gem 'callcredit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install callcredit

## Configuration

    CallCredit.configure do |config|
      config.company = 'company_name'
      config.username = 'username'
      config.password = 'password'
    end


## Usage


    require 'callcredit'

and then

    cc = CallCredit::Search.new


To perform a search, you'd provide the following information on a
person:

    cc.add_person(forename: "Julia", surname: "Audi", dob: "1943-03-06")
    cc.add_address(number: 1, postcode: "X9 9LF")
    cc.search

which will return the results available in the Call Credit database.

If you wanted to perform a search on multiple addresses you'd add them
like so:

    cc.add_person(forename: "Julia", surname: "Audi", dob: "1943-03-06")
    cc.add_address(number: 1, postcode: "X9 9LF")
    cc.add_address(number: 44, postcode: "V2 2BT")
    cc.search
