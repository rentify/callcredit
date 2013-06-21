require "callcredit/version"
require "config_env"
require "person"
require "address"

class CallCredit
  attr_accessor :person, :address

  def initialize(*opt)
    @person = Person.new
    @address = Address.new
  end

end
