require "callcredit/config_env"
require "callcredit/errors"
require "callcredit/xml_maker"
require "callcredit/json_maker"
require "savon"

class CallCredit
  attr_reader :addresses, :people, :conf, :client

  MAX_ADDRESSES = 10
  MAX_PEOPLE = 2

  def initialize(*opt)
    @conf = choose_env(opt)

    @client = Savon.client do |globals|
      globals.wsdl @conf.env["wsdl"]
      globals.log false
    end

    @addresses = []
    @people = []
  end

  def search
    raise NoPersonError, "no person added" if @people.length == 0
    raise NoAddressError, "no address added" if @addresses.length == 0
    payload = XMLmaker.person(self)
    response = @client.call(:search07a, xml: payload)
    JSONmaker.parse response.to_xml
  end

  def add_address(*args)
    validate_address_count
    validate_address_params(args)
    @addresses << args
    @addresses.flatten!
  end

  def add_person(*args)
    validate_person_count
    validate_people_params(args)
    @people << args
    @people.flatten!
  end

  private
  def choose_env(opt)
    if opt.length == 1
      ConfigEnv.new :production if opt.first.has_key? :production
    else
      ConfigEnv.new
    end
  end

  def validate_person_count
    raise PersonError, "too many people" if @people.size == MAX_PEOPLE
  end

  def validate_people_params(*args)
    valid_attribs = [:forename, :surname, :dob, :title]

    args.flatten.each do |arg|
      arg.each do |k,v|
        raise PersonError, "invalid attribute #{k} for person" unless valid_attribs.include? k
      end
    end
  end

  def validate_address_count
    raise AddressError, "too many addresses" if @addresses.size == MAX_ADDRESSES
  end

  def validate_address_params(*args)
    valid_attribs = [:number, :postcode, :street, :place]

    args.flatten.each do |arg|
      arg.each do |k,v|
        raise AddressError, "invalid attribute #{k} for address" unless valid_attribs.include? k
      end
    end
  end
end
