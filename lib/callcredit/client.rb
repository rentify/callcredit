module CallCredit
  class Client
    def search(searcher)
      payload = CallCredit::XMLmaker.person(searcher)
      response = @client.call(:search07a, xml: payload)
      [response, CallCredit::JSONmaker.parse response.to_xml]
    rescue Savon::Error => error
      error_code = error.to_hash[:fault][:faultcode]
      error_string = error.to_hash[:fault][:faultstring]
      error_detail = error.to_hash[:fault][:detail][:error_block][:error]
      raise CallCredit::DataError, "#{error_code}: #{error_string} ---- #{error_detail}"
    end
  end
end
