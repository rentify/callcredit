require "callcredit/search"
require "callcredit/xml_maker"
require "callcredit/json_maker"
require "savon"

module CallCredit

  ROOT_PATH   = File.dirname(__FILE__)
  MAX_ADDRESSES = 10
  MAX_PEOPLE = 2

  class CallCredit::AddressError < StandardError; end
  class CallCredit::PersonError < StandardError; end
  class CallCredit::NoPersonError < StandardError; end
  class CallCredit::NoAddressError < StandardError; end
  class CallCredit::DataError < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :company, :username, :password
  end

end