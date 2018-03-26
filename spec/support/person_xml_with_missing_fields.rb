# manual fake name see applicant for details
def person_xml_with_missing_fields
  <<-XMLRESPONSE
      <s:Envelope xmlns:s="http://www.w3.org/2003/05/soap-envelope" xmlns:u="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
        <s:Header>
          <o:Security s:mustUnderstand="1" xmlns:o="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
            <u:Timestamp u:Id="_0">
              <u:Created>2018-03-23T18:46:39.325Z</u:Created>
              <u:Expires>2018-03-23T18:51:39.325Z</u:Expires>
            </u:Timestamp>
          </o:Security>
        </s:Header>
        <s:Body xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
          <SearchResponse xmlns="http://www.callcredit.co.uk/SingleAccessPointService/ISingleAccessPointService/1.0">
            <SearchResult>
              <SystemData>
                <RequestReferenceId>a4d16428-958a-4db2-b075-bbf4596a53ca</RequestReferenceId>
                <TimeStamp>2018-03-23T18:46:39.3189851Z</TimeStamp>
                <TraceId>008-011</TraceId>
              </SystemData>
              <Error>
                <Success>true</Success>
              </Error>
              <ProductResponses>
                <CallReport7>
                  <CallReport7Response>
                    <Response>
                      <jobdetails xmlns="urn:callcredit.co.uk/soap:callreport7">
                        <searchid>{022CBCA0-4E20-46DC-BA0F-14998114ECC0}</searchid>
                        <cast>004.004.7.2.1.2.0.41158402.0</cast>
                        <pstv>41158402</pstv>
                        <ls>0</ls>
                        <searchdate>2018-03-23T18:46:38</searchdate>
                      </jobdetails>
                      <yourreference xmlns="urn:callcredit.co.uk/soap:callreport7"/>
                      <creditrequest datasets="255" schemaversion="7.1" xmlns="urn:callcredit.co.uk/soap:callreport7">
                        <applicant>
                          <address>
                            <abodeno>606</abodeno>
                            <postcode>X9 9AA</postcode>
                          </address>
                          <name>
                            <title>Mr</title>
                            <forename>Mike</forename>
                            <surname>Fake</surname>
                          </name>
                          <dob>1929-10-01</dob>
                          <hho>0</hho>
                          <tpoptout>1</tpoptout>
                        </applicant>
                        <score>1</score>
                        <purpose>TV</purpose>
                      </creditrequest>
                      <picklist maxaddressitems="20" maxnameitems="9" picklist="1" regenerated="0" xmlns="urn:callcredit.co.uk/soap:callreport7">
                        <applicant id="1" reporttype="1">
                          <address addressid="1">
                            <addressinput>
                              <abodeno>606</abodeno>
                              <postcode>X9 9AA</postcode>
                            </addressinput>
                            <fullmatches matchstatus="2" reporttype="1">
                              <fullmatch selected="1">
                                <addressmatch>
                                  <abodeno/>
                                  <buildingno>606</buildingno>
                                  <buildingname/>
                                  <street1>ALLEY CAT LANE</street1>
                                  <street2/>
                                  <sublocality/>
                                  <locality/>
                                  <posttown>TEST TOWN</posttown>
                                  <postcode>X9 9AA</postcode>
                                  <domicileid>35241397</domicileid>
                                </addressmatch>
                                <name nameid="1">
                                  <nameinput>
                                    <title>Mr</title>
                                    <forename>Mike</forename>
                                    <surname>Fake</surname>
                                  </nameinput>
                                  <namematches matchstatus="2" reporttype="1"/>
                                </name>
                              </fullmatch>
                            </fullmatches>
                          </address>
                        </applicant>
                      </picklist>
                      <creditreport linktype="0" searchid="{022CBCA0-4E20-46DC-BA0F-14998114ECC0}" xmlns="urn:callcredit.co.uk/soap:callreport7">
                        <applicant ageflag="0" reporttitle="Not matched for Fake" reporttype="1" tpoptout="1">
                          <summary>
                            <searches>
                              <totalsearches3months>0</totalsearches3months>
                              <totalsearches12months>0</totalsearches12months>
                              <totalhomecreditsearches3months>0</totalhomecreditsearches3months>
                            </searches>
                            <judgments>
                              <totalactive>0</totalactive>
                              <totalsatisfied>0</totalsatisfied>
                            </judgments>
                            <bais>
                              <totaldischarged>0</totaldischarged>
                              <currentlyinsolvent>0</currentlyinsolvent>
                              <restricted>0</restricted>
                            </bais>
                            <notices>
                              <nocflag>0</nocflag>
                              <totaldisputes>0</totaldisputes>
                            </notices>
                            <links>
                              <totalundecaddressessearched>0</totalundecaddressessearched>
                              <totalundecaddressesunsearched>0</totalundecaddressesunsearched>
                              <totalundecaliases>0</totalundecaliases>
                            </links>
                            <summaryaddress>
                              <pafvalid>1</pafvalid>
                              <rollingroll>0</rollingroll>
                              <messagecode>11</messagecode>
                            </summaryaddress>
                            <address current="1" id="1" messagecode="7">606 ALLEY CAT LANE, TEST TOWN X9 9AA</address>
                          </summary>
                          <creditscores>
                            <creditscore>
                              <score class="10">604</score>
                              <reasons>
                                <code>402</code>
                                <code>302</code>
                                <code>0</code>
                                <code>0</code>
                              </reasons>
                            </creditscore>
                          </creditscores>
                          <addressconfs>
                            <addressconf pafvalid="1">
                              <address current="1">606 ALLEY CAT LANE, TEST TOWN X9 9AA</address>
                              <resident currentname="0" declaredalias="0" matchtype="HM">
                                <name>GLENDA MANX</name>
                                <duration>P7M</duration>
                                <startdate>2017-08-23</startdate>
                                <ervalid>1</ervalid>
                                <erhistory>
                                  <startdate>2017-08-23</startdate>
                                  <optout>0</optout>
                                  <rollingroll>0</rollingroll>
                                </erhistory>
                              </resident>
                              <resident currentname="0" declaredalias="0" matchtype="HM">
                                <name>ELIZABETH TEST-PERSON TABBY</name>
                                <duration>P19M</duration>
                                <startdate>2016-08-23</startdate>
                                <ervalid>1</ervalid>
                                <erhistory>
                                  <startdate>2016-08-23</startdate>
                                  <optout>0</optout>
                                  <rollingroll>0</rollingroll>
                                </erhistory>
                              </resident>
                              <resident currentname="0" declaredalias="0" matchtype="HM">
                                <name>GLENDA TEST-PERSON BURMESE</name>
                                <duration>P12M</duration>
                                <startdate>2016-08-23</startdate>
                                <enddate>2017-08-23</enddate>
                                <ervalid>3</ervalid>
                                <erhistory>
                                  <startdate>2016-08-23</startdate>
                                  <enddate>2017-08-23</enddate>
                                  <optout>0</optout>
                                  <rollingroll>0</rollingroll>
                                </erhistory>
                              </resident>
                              <resident currentname="0" declaredalias="0" matchtype="HM">
                                <name>FRED TEST-PERSON MANX</name>
                                <duration>P108M</duration>
                                <startdate>2008-08-23</startdate>
                                <enddate>2017-08-23</enddate>
                                <ervalid>3</ervalid>
                                <erhistory>
                                  <startdate>2008-08-23</startdate>
                                  <enddate>2017-08-23</enddate>
                                  <optout>0</optout>
                                  <rollingroll>0</rollingroll>
                                </erhistory>
                              </resident>
                            </addressconf>
                          </addressconfs>
                          <demographics2006>
                            <cameouk>04E</cameouk>
                            <cameoincome>33</cameoincome>
                            <cameoinvestor>33</cameoinvestor>
                            <cameoproperty>08</cameoproperty>
                            <cameofing>3</cameofing>
                            <property>
                              <ctaxband>G</ctaxband>
                              <priceindex>8065</priceindex>
                            </property>
                          </demographics2006>
                        </applicant>
                      </creditreport>
                    </Response>
                    <Error>
                      <Success>true</Success>
                    </Error>
                    <ResponseIndividuals>
                      <ResponseIndividual>
                        <Id>1</Id>
                      </ResponseIndividual>
                    </ResponseIndividuals>
                  </CallReport7Response>
                </CallReport7>
              </ProductResponses>
            </SearchResult>
          </SearchResponse>
        </s:Body>
      </s:Envelope>
    XMLRESPONSE
end
