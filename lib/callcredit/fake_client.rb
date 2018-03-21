require 'ostruct'
require "callcredit/dummy_http_response"

module CallCredit
  class FakeClient
    def search(searcher)
      if CallCredit.configuration.dummy_xml_response_file
        response = DummyHttpResponse.mock
        [response, CallCredit::JSONmaker.parse(response.to_xml)]
      else
        dummy_json(searcher)
      end
    end

    def dummy_json(searcher)
      person = searcher.people.first
      addresses = searcher.addresses
      score = addresses.first[:number]
      result = { creditscore: score,
        forename: person[:forename], surname: person[:surname], dob: person[:dob],
        dead_or_alive: 'alive',
        addresses: addresses,
        electoral_roll: 'Y',
        ccj: {active: 0, satisfied: 0},
        bankruptcy: {discharged: 0, insolvent: 0, restricted: 0},
        financial_risk: 'N',
        income_type: '',
        investor_category: '',
        property_value: '',
        area_makeup: '',
      }
      [result, result]
    end
  end
end
