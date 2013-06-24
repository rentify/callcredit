require "callcredit/version"
require "config_env"
require "person"
require "address"
require "xml_maker"
require "savon"

class CallCredit
  attr_accessor :person, :address, :client, :conf

  def initialize(*opt)
    @conf = choose_env(opt)
    wsdl_file = @conf.env["wsdl"]
    @client = Savon.client { wsdl wsdl_file }
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
