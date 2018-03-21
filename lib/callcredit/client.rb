module CallCredit
  class Client
    def initialize(environment, logger)
      @client = Savon.client(soap_version: 2, headers: headers) do |globals|
        globals.wsdl File.join(ROOT_PATH, "data/SingleAccessPoint.#{environment}.wsdl")
        globals.log true
        globals.log_level :debug
        globals.logger logger
      end
    end

    def search(searcher)
      payload = CallCredit::XMLmaker.person(searcher)
      #response = @client.call(:search, xml: payload)
      response = DummyHttpResponse.mock(@client.globals)
      [response, CallCredit::JSONmaker.parse(response.to_xml)]
    rescue Savon::Error => error
      error_code = error.to_hash[:fault][:code][:value]
      sub_error_code = error.to_hash[:fault][:code][:subcode][:value]
      error_string = error.to_hash[:fault][:reason][:text]
      raise CallCredit::DataError, "#{error_code}: #{sub_error_code} ---- #{error_string}"
    end

    def headers
      # seems weird but actually call credits crazy way of stuffing multiple headers in content type
      # actually seems not unheard of in soap 1.2 but no specific mention of it in the docs
      # worth noting if we need to call other actions then this need to be moved to so it is set per request
      # then should be able to pull it out of one of savon's headers
      actual_content_type = "application/soap+xml"
      char_set = "UTF-8"
      action = '"http://www.callcredit.co.uk/SingleAccessPointService/ISingleAccessPointService/1.0/ISingleAccessPointService/Search"'
      headers = { "Content-Type" => "#{actual_content_type};charset=#{char_set};action=#{action}" }
    end
  end
end
