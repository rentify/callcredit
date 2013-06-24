
def xml_result
  '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:soap="urn:callcredit.co.uk/soap:callreport7">
    <soapenv:Header>
      <soap:callcreditheaders>
        <soap:company>Rentify CR CTEST</soap:company>
        <soap:username>Rentify API CR CTEST</soap:username>
        <soap:password>lequ1li8di</soap:password>
      </soap:callcreditheaders>
    </soapenv:Header>
    <soapenv:Body>
      <soap:Search07a>
        <soap:SearchDefinition>
          <soap:creditrequest schemaversion="7.0" datasets="255">
            <soap:applicant>
              <soap:address>
                <soap:buildingno>10</soap:buildingno>
                <soap:postcode>X9 9LF</soap:postcode>
              </soap:address>
              <soap:name>
                <soap:forename>Julia</soap:forename>
                <soap:surname>Audi</soap:surname>
              </soap:name>
              <soap:dob>1910-01-01</soap:dob>
              <soap:hho>0</soap:hho>
              <soap:tpoptout>1</soap:tpoptout>
              <soap:applicantdemographics>
                <soap:employment/>
              </soap:applicantdemographics>
            </soap:applicant>
            <soap:score>1</soap:score>
            <soap:purpose>TV</soap:purpose>
            <soap:autosearch>1</soap:autosearch>
            <soap:autosearchmaximum>3</soap:autosearchmaximum>
          </soap:creditrequest>
        </soap:SearchDefinition>
      </soap:Search07a>
    </soapenv:Body>
  </soapenv:Envelope>'
end
