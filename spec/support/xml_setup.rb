
def xml_result
  <<-XML
    <soap:Envelope xmlns:ns="http://www.callcredit.co.uk/SingleAccessPointService/ISingleAccessPointService/1.0" xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
      <soap:Header>
        <Security xmlns="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
          <UsernameToken>
            <Username>Rentify CR CTEST\\Rentify API CR CTEST</Username>
            <Password>lequ1li8di</Password>
          </UsernameToken>
        </Security>
      </soap:Header>
      <soap:Body>
        <ns:Search>
      <ns:request>
        <ns:Individuals><ns:Individual>
      <ns:DateOfBirth>1910-01-01</ns:DateOfBirth>
      <ns:Names>
        <ns:Name>
          <ns:Title/>
          <ns:GivenName>Julia</ns:GivenName>
          <ns:FamilyName1>Audi</ns:FamilyName1>
        </ns:Name>
      </ns:Names>
      <ns:Addresses>
        <ns:Address>
          <ns:Line1>10</ns:Line1>
          <ns:Line10>X9 9LF</ns:Line10>
          <ns:CountryCode>GB</ns:CountryCode>
        </ns:Address>
      </ns:Addresses>
      <ns:ApplicationSettings>
        <ns:HouseholdSearchEnabled>false</ns:HouseholdSearchEnabled>
        <ns:ThirdPartyOptOut>true</ns:ThirdPartyOptOut>
      </ns:ApplicationSettings>
    </ns:Individual></ns:Individuals>
        <ns:ProductsToCall>
          <ns:CallReport7 DataSets="255">
            <ns:Score>1</ns:Score>
            <ns:Purpose>TV</ns:Purpose>
          </ns:CallReport7>
        </ns:ProductsToCall>
      </ns:request>
    </ns:Search>
      </soap:Body>
    </soap:Envelope>
  XML
end

def xml_result_with_building_name
  <<-XML
    <soap:Envelope xmlns:ns="http://www.callcredit.co.uk/SingleAccessPointService/ISingleAccessPointService/1.0" xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
      <soap:Header>
        <Security xmlns="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
          <UsernameToken>
            <Username>Rentify CR CTEST\\Rentify API CR CTEST</Username>
            <Password>lequ1li8di</Password>
          </UsernameToken>
        </Security>
      </soap:Header>
      <soap:Body>
        <ns:Search>
      <ns:request>
        <ns:Individuals><ns:Individual>
      <ns:DateOfBirth>1910-01-01</ns:DateOfBirth>
      <ns:Names>
        <ns:Name>
          <ns:Title/>
          <ns:GivenName>Julia</ns:GivenName>
          <ns:FamilyName1>Audi</ns:FamilyName1>
        </ns:Name>
      </ns:Names>
      <ns:Addresses>
        <ns:Address>
          <ns:Line1>RentifyHq</ns:Line1>
          <ns:Line10>X9 9LF</ns:Line10>
          <ns:CountryCode>GB</ns:CountryCode>
        </ns:Address>
      </ns:Addresses>
      <ns:ApplicationSettings>
        <ns:HouseholdSearchEnabled>false</ns:HouseholdSearchEnabled>
        <ns:ThirdPartyOptOut>true</ns:ThirdPartyOptOut>
      </ns:ApplicationSettings>
    </ns:Individual></ns:Individuals>
        <ns:ProductsToCall>
          <ns:CallReport7 DataSets="255">
            <ns:Score>1</ns:Score>
            <ns:Purpose>TV</ns:Purpose>
          </ns:CallReport7>
        </ns:ProductsToCall>
      </ns:request>
    </ns:Search>
      </soap:Body>
    </soap:Envelope>
  XML
end

def xml_result_with_abodeno
  <<-XML
    <soap:Envelope xmlns:ns="http://www.callcredit.co.uk/SingleAccessPointService/ISingleAccessPointService/1.0" xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
      <soap:Header>
        <Security xmlns="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
          <UsernameToken>
            <Username>Rentify CR CTEST\\Rentify API CR CTEST</Username>
            <Password>lequ1li8di</Password>
          </UsernameToken>
        </Security>
      </soap:Header>
      <soap:Body>
        <ns:Search>
      <ns:request>
        <ns:Individuals><ns:Individual>
      <ns:DateOfBirth>1910-01-01</ns:DateOfBirth>
      <ns:Names>
        <ns:Name>
          <ns:Title/>
          <ns:GivenName>Julia</ns:GivenName>
          <ns:FamilyName1>Audi</ns:FamilyName1>
        </ns:Name>
      </ns:Names>
      <ns:Addresses>
        <ns:Address>
          <ns:Line1>1234</ns:Line1>
          <ns:Line1>RentifyHq</ns:Line1>
          <ns:Line10>X9 9LF</ns:Line10>
          <ns:CountryCode>GB</ns:CountryCode>
        </ns:Address>
      </ns:Addresses>
      <ns:ApplicationSettings>
        <ns:HouseholdSearchEnabled>false</ns:HouseholdSearchEnabled>
        <ns:ThirdPartyOptOut>true</ns:ThirdPartyOptOut>
      </ns:ApplicationSettings>
    </ns:Individual></ns:Individuals>
        <ns:ProductsToCall>
          <ns:CallReport7 DataSets="255">
            <ns:Score>1</ns:Score>
            <ns:Purpose>TV</ns:Purpose>
          </ns:CallReport7>
        </ns:ProductsToCall>
      </ns:request>
    </ns:Search>
      </soap:Body>
    </soap:Envelope>
  XML
end
