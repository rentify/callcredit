require "callcredit/version"
require "callcredit/config_env"
require "callcredit/person"
require "callcredit/address"
require "callcredit/errors"
require "callcredit/xml_maker"
require "savon"

class CallCredit
  attr_accessor :person, :address, :client, :conf
  attr_reader :addresses, :people

  MAX_ADDRESSES = 10
  MAX_PEOPLE = 2

  def initialize(*opt)
    @conf = choose_env(opt)
    wsdl_file = @conf.env["wsdl"]
    @client = Savon.client { wsdl wsdl_file; log false }
    @person = Person.new
    @address = Address.new
    @addresses = []
    @people = []
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
    raise StandardError, "too many people" if @people.size == MAX_PEOPLE
  end

  def validate_people_params(*args)
    valid_attribs = [:forename, :surname, :dob, :title]

    args.flatten.each do |arg|
      arg.each do |k,v|
        raise StandardError, "invalid attribute #{k} for person" unless valid_attribs.include? k
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
