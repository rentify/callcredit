require "callcredit/version"
require "config_env"
require "person"
require "address"
require "savon"

class CallCredit
  attr_accessor :person, :address, :client

  def initialize(*opt)
    conf = choose_env(opt)
    @client = Savon.client { wsdl conf.env["wsdl"] }
    @person = Person.new
    @address = Address.new
  end

  def search
    {}
  end

  private
  def choose_env(opt)
    if opt.length == 1
      ConfigEnv.new :production if opt.first.has_key? :production
    else
      ConfigEnv.new
    end
  end
end
