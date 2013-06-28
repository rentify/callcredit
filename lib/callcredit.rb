require "callcredit/version"
require "callcredit/config_env"
require "callcredit/person"
require "callcredit/address"
require "callcredit/xml_maker"
require "savon"

class CallCredit
  attr_accessor :person, :address, :client, :conf
  attr_reader :addresses

  MAX_ADDRESSES = 10

  def initialize(*opt)
    @conf = choose_env(opt)
    wsdl_file = @conf.env["wsdl"]
    @client = Savon.client { wsdl wsdl_file; log false }
    @person = Person.new
    @address = Address.new
    @addresses = []
  end

  def search
    payload = XMLmaker.person(self)
    response = @client.call(:search07a, xml: payload)
    response.body
  end

  def add_address(*args)
    validate_address_count
    validate_address_params(args)
    @addresses << args
    @addresses.flatten!
  end

  private
  def choose_env(opt)
    if opt.length == 1
      ConfigEnv.new :production if opt.first.has_key? :production
    else
      ConfigEnv.new
    end
  end

  def validate_address_count
    raise StandardError, "too many addresses" if @addresses.size == MAX_ADDRESSES
  end

  def validate_address_params(*args)
    valid_attribs = [:number, :postcode, :street, :place]

    args.flatten.each do |arg|
      arg.each do |k,v|
        raise StandardError, "invalid attribute #{k} for address" unless valid_attribs.include? k
      end
    end
  end
end
