# FRED TEST-PERSON MANX - TP148488400
def person_with_ccj
  <<-XMLRESPONSE
    <s:Envelope xmlns:s="http://www.w3.org/2003/05/soap-envelope" xmlns:u="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
      <s:Header>
        <o:Security s:mustUnderstand="1" xmlns:o="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
          <u:Timestamp u:Id="_0">
            <u:Created>2018-03-22T18:25:07.732Z</u:Created>
            <u:Expires>2018-03-22T18:30:07.732Z</u:Expires>
          </u:Timestamp>
        </o:Security>
      </s:Header>
      <s:Body xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <SearchResponse xmlns="http://www.callcredit.co.uk/SingleAccessPointService/ISingleAccessPointService/1.0">
          <SearchResult>
            <SystemData>
              <RequestReferenceId>3d4aeedb-5db3-48f6-9fe4-412a8c2f1cee</RequestReferenceId>
              <TimeStamp>2018-03-22T18:25:07.6045347Z</TimeStamp>
              <TraceId>008-012</TraceId>
            </SystemData>
            <Error>
              <Success>true</Success>
            </Error>
            <ProductResponses>
              <CallReport7>
                <CallReport7Response>
                  <Response>
                    <jobdetails xmlns="urn:callcredit.co.uk/soap:callreport7">
                      <searchid>{52EDFE85-37D8-457A-A20A-1AFB60044A37}</searchid>
                      <cast>004.005.7.2.1.2.0.41158402.0</cast>
                      <pstv>41158402</pstv>
                      <ls>0</ls>
                      <searchdate>2018-03-22T18:25:10</searchdate>
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
                          <forename>Fred</forename>
                          <surname>Manx</surname>
                        </name>
                        <dob>1930-10-10</dob>
                        <hho>0</hho>
                        <tpoptout>1</tpoptout>
                      </applicant>
                      <score>1</score>
                      <purpose>TV</purpose>
                    </creditrequest>
                    <picklist maxaddressitems="20" maxnameitems="9" picklist="1" regenerated="0" xmlns="urn:callcredit.co.uk/soap:callreport7">
                      <applicant id="1" reporttype="3">
                        <address addressid="1">
                          <addressinput>
                            <abodeno>606</abodeno>
                            <postcode>X9 9AA</postcode>
                          </addressinput>
                          <fullmatches matchstatus="2" reporttype="3">
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
                                  <forename>Fred</forename>
                                  <surname>Manx</surname>
                                </nameinput>
                                <namematches matchstatus="2" reporttype="3">
                                  <namematch selected="1">
                                    <title>MR</title>
                                    <forename>FRED</forename>
                                    <othernames>TEST-PERSON</othernames>
                                    <surname>MANX</surname>
                                    <suffix/>
                                    <residenceid>148488400</residenceid>
                                    <dob>1930-10-10</dob>
                                  </namematch>
                                </namematches>
                              </name>
                            </fullmatch>
                          </fullmatches>
                        </address>
                      </applicant>
                    </picklist>
                    <creditreport linktype="0" searchid="{52EDFE85-37D8-457A-A20A-1AFB60044A37}" xmlns="urn:callcredit.co.uk/soap:callreport7">
                      <applicant ageflag="0" autosearchmaxexceeded="0" reporttitle="FRED TEST-PERSON MANX " reporttype="3" tpoptout="1">
                        <summary>
                          <searches>
                            <totalsearches3months>0</totalsearches3months>
                            <totalsearches12months>0</totalsearches12months>
                            <totalhomecreditsearches3months>0</totalhomecreditsearches3months>
                          </searches>
                          <judgments>
                            <totalactive>0</totalactive>
                            <totalsatisfied>1</totalsatisfied>
                          </judgments>
                          <bais>
                            <totaldischarged>0</totaldischarged>
                            <currentlyinsolvent>1</currentlyinsolvent>
                            <restricted>0</restricted>
                          </bais>
                          <notices>
                            <nocflag>1</nocflag>
                            <totaldisputes>0</totaldisputes>
                          </notices>
                          <links>
                            <totalundecaddressessearched>0</totalundecaddressessearched>
                            <totalundecaddressesunsearched>0</totalundecaddressesunsearched>
                            <totalundecaliases>0</totalundecaliases>
                          </links>
                          <summaryaddress>
                            <pafvalid>1</pafvalid>
                            <messagecode>2</messagecode>
                          </summaryaddress>
                          <address current="1" id="1" messagecode="2">606 ALLEY CAT LANE, TEST TOWN X9 9AA</address>
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
                            <resident currentname="1" declaredalias="0" matchtype="IM">
                              <name>FRED TEST-PERSON MANX</name>
                              <duration>P108M</duration>
                              <startdate>2008-08-22</startdate>
                              <enddate>2017-08-22</enddate>
                              <ervalid>3</ervalid>
                              <erhistory>
                                <startdate>2008-08-22</startdate>
                                <enddate>2017-08-22</enddate>
                                <optout>0</optout>
                                <rollingroll>0</rollingroll>
                              </erhistory>
                            </resident>
                            <resident currentname="0" declaredalias="0" matchtype="SM">
                              <name>GLENDA MANX</name>
                              <duration>P7M</duration>
                              <startdate>2017-08-22</startdate>
                              <ervalid>1</ervalid>
                              <erhistory>
                                <startdate>2017-08-22</startdate>
                                <optout>0</optout>
                                <rollingroll>0</rollingroll>
                              </erhistory>
                            </resident>
                            <resident currentname="0" declaredalias="0" matchtype="HM">
                              <name>GLENDA TEST-PERSON BURMESE</name>
                              <duration>P12M</duration>
                              <startdate>2016-08-22</startdate>
                              <enddate>2017-08-22</enddate>
                              <ervalid>3</ervalid>
                              <erhistory>
                                <startdate>2016-08-22</startdate>
                                <enddate>2017-08-22</enddate>
                                <optout>0</optout>
                                <rollingroll>0</rollingroll>
                              </erhistory>
                            </resident>
                            <resident currentname="0" declaredalias="0" matchtype="HM">
                              <name>ELIZABETH TEST-PERSON TABBY</name>
                              <duration>P19M</duration>
                              <startdate>2016-08-22</startdate>
                              <ervalid>1</ervalid>
                              <erhistory>
                                <startdate>2016-08-22</startdate>
                                <optout>0</optout>
                                <rollingroll>0</rollingroll>
                              </erhistory>
                            </resident>
                          </addressconf>
                        </addressconfs>
                        <judgments>
                          <judgment>
                            <name>MR FRED MANX</name>
                            <address current="1">606 ALLEY CAT LANE X9 9AA</address>
                            <courtname>TESTTOWN</courtname>
                            <courttype>0</courttype>
                            <casenumber>TEST 7825221</casenumber>
                            <status>SS</status>
                            <amount>250</amount>
                            <judgmentdate>2014-09-22</judgmentdate>
                            <datesatisfied>2016-07-22</datesatisfied>
                            <notice>
                              <type>C</type>
                              <refnum>REF CCJ148488400</refnum>
                              <dateraised>2018-03-16</dateraised>
                              <text>Im a Test Person, but this CCJ is not correct!</text>
                            </notice>
                          </judgment>
                        </judgments>
                        <bais>
                          <bai>
                            <courtname>TESTTOWN</courtname>
                            <currentstatus>A</currentstatus>
                            <ordertype>TD</ordertype>
                            <orderdate>2016-07-22</orderdate>
                            <caseyear>2009</caseyear>
                            <caseref>001</caseref>
                            <name>MR FRED MANX</name>
                            <address current="1">606 ALLEY CAT LANE X9 9AA</address>
                          </bai>
                        </bais>
                        <searches/>
                        <addresslinks/>
                        <aliaslinks/>
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
