module CallCredit
  class Search

    attr_reader :addresses, :people, :client, :response

    def initialize
      @addresses = []
      @people = []
      @response = nil
      environment = CallCredit.configuration.environment != 'production' ? 'development' : 'production'
      if environment == 'production'
        @client = CallCredit::Client.new(environment, $logger)
      else
        @client = CallCredit::FakeClient.new
      end
    end

    def search
      raise CallCredit::NoPersonError, "no person added" if @people.length == 0
      raise CallCredit::NoAddressError, "no address added" if @addresses.length == 0

      @response, result = @client.search self
      result
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

    # could be private
    def validate_person_count
      raise CallCredit::PersonError, "too many people" if @people.size == MAX_PEOPLE
    end

    def validate_people_params(*args)
      valid_attribs = [:forename, :surname, :dob, :title]

      args.flatten.each do |arg|
        arg.each do |k,v|
          raise CallCredit::PersonError, "invalid attribute #{k} for person" unless valid_attribs.include? k
        end
      end
    end

    def validate_address_count
      raise CallCredit::AddressError, "too many addresses" if @addresses.size == MAX_ADDRESSES
    end

    def validate_address_params(*args)
      valid_attribs = [:abodeno, :number, :buildingname, :postcode, :street, :place]

      args.flatten.each do |arg|
        arg.each do |k,v|
          raise CallCredit::AddressError, "invalid attribute #{k} for address" unless valid_attribs.include? k
        end
      end
    end

  end
end
