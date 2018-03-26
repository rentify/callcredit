# GLENDA TEST-PERSON BURMESE - TP148488405
def person_xml
  <<-XMLRESPONSE
    <s:Envelope xmlns:s="http://www.w3.org/2003/05/soap-envelope" xmlns:u="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
      <s:Header>
        <o:Security s:mustUnderstand="1" xmlns:o="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
          <u:Timestamp u:Id="_0">
            <u:Created>2018-03-23T16:56:41.437Z</u:Created>
            <u:Expires>2018-03-23T17:01:41.437Z</u:Expires>
          </u:Timestamp>
        </o:Security>
      </s:Header>
      <s:Body xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <SearchResponse xmlns="http://www.callcredit.co.uk/SingleAccessPointService/ISingleAccessPointService/1.0">
          <SearchResult>
            <SystemData>
              <RequestReferenceId>32d15785-1e25-4de5-aba3-6ac1fa1cc05c</RequestReferenceId>
              <TimeStamp>2018-03-23T16:56:41.4295804Z</TimeStamp>
              <TraceId>007-011</TraceId>
            </SystemData>
            <Error>
              <Success>true</Success>
            </Error>
            <ProductResponses>
              <CallReport7>
                <CallReport7Response>
                  <Response>
                    <jobdetails xmlns="urn:callcredit.co.uk/soap:callreport7">
                      <searchid>{A70A822A-41DF-45C9-B75D-29F7019B0483}</searchid>
                      <cast>005.004.7.2.1.2.0.41158402.0</cast>
                      <pstv>41158402</pstv>
                      <ls>0</ls>
                      <searchdate>2018-03-23T16:56:40</searchdate>
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
                          <forename>Glenda</forename>
                          <surname>Burmese</surname>
                        </name>
                        <dob>1962-06-15</dob>
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
                                  <forename>Glenda</forename>
                                  <surname>Burmese</surname>
                                </nameinput>
                                <namematches matchstatus="2" reporttype="3">
                                  <namematch selected="1">
                                    <title>MRS</title>
                                    <forename>GLENDA</forename>
                                    <othernames>TEST-PERSON</othernames>
                                    <surname>BURMESE</surname>
                                    <suffix/>
                                    <residenceid>148488405</residenceid>
                                    <dob>1962-06-15</dob>
                                  </namematch>
                                </namematches>
                              </name>
                            </fullmatch>
                          </fullmatches>
                        </address>
                      </applicant>
                    </picklist>
                    <creditreport linktype="0" searchid="{A70A822A-41DF-45C9-B75D-29F7019B0483}" xmlns="urn:callcredit.co.uk/soap:callreport7">
                      <applicant ageflag="0" autosearchmaxexceeded="0" reporttitle="GLENDA TEST-PERSON BURMESE " reporttype="3" tpoptout="1">
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
                            <totalundecaddressessearched>1</totalundecaddressessearched>
                            <totalundecaddressesunsearched>0</totalundecaddressesunsearched>
                            <totalundecaliases>1</totalundecaliases>
                          </links>
                          <summaryaddress>
                            <pafvalid>1</pafvalid>
                            <rollingroll>0</rollingroll>
                            <messagecode>1</messagecode>
                          </summaryaddress>
                          <address current="0" id="1" messagecode="2" undeclaredaddresstype="2">608 ALLEY CAT LANE, TEST TOWN X9 9AA</address>
                          <address current="1" id="2" messagecode="1">606 ALLEY CAT LANE, TEST TOWN X9 9AA</address>
                        </summary>
                        <creditscores>
                          <creditscore>
                            <score class="10">605</score>
                            <reasons>
                              <code>402</code>
                              <code>0</code>
                              <code>0</code>
                              <code>0</code>
                            </reasons>
                          </creditscore>
                        </creditscores>
                        <addressconfs>
                          <addressconf pafvalid="1">
                            <address current="0" undeclaredaddresstype="2">608 ALLEY CAT LANE, TEST TOWN X9 9AA</address>
                            <resident currentname="0" declaredalias="1" matchtype="IM">
                              <name>GLENDA TEST-PERSON BURMESE</name>
                              <duration>P96M</duration>
                              <startdate>2008-08-23</startdate>
                              <enddate>2016-08-23</enddate>
                              <ervalid>3</ervalid>
                              <erhistory>
                                <startdate>2008-08-23</startdate>
                                <enddate>2016-08-23</enddate>
                                <optout>0</optout>
                                <rollingroll>0</rollingroll>
                              </erhistory>
                            </resident>
                          </addressconf>
                          <addressconf pafvalid="1">
                            <address current="1">606 ALLEY CAT LANE, TEST TOWN X9 9AA</address>
                            <resident currentname="0" declaredalias="1" matchtype="IM">
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
                            <resident currentname="1" declaredalias="0" matchtype="IM">
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
                            <resident currentname="0" declaredalias="0" matchtype="SM">
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
                          </addressconf>
                        </addressconfs>
                        <judgments>
                          <judgment>
                            <name>MRS GLENDA BURMESE</name>
                            <address current="0" undeclaredaddresstype="2">608 ALLEY CAT LANE X9 9AA</address>
                            <courtname>TESTTOWN</courtname>
                            <courttype>0</courttype>
                            <casenumber>TEST 7825227</casenumber>
                            <status>SS</status>
                            <amount>4321</amount>
                            <judgmentdate>2015-05-23</judgmentdate>
                            <datesatisfied>2018-01-21</datesatisfied>
                          </judgment>
                        </judgments>
                        <bais>
                          <bai>
                            <courtname>TESTTOWN</courtname>
                            <currentstatus>A</currentstatus>
                            <ordertype>BO</ordertype>
                            <orderdate>2016-02-23</orderdate>
                            <caseyear>2005</caseyear>
                            <caseref>408913</caseref>
                            <name>MRS GLENDA BURMESE</name>
                            <address current="0" undeclaredaddresstype="2">608 ALLEY CAT LANE X9 9AA</address>
                          </bai>
                        </bais>
                        <nocs>
                          <noc>
                            <refnum>REF148488407</refnum>
                            <dateraised>2018-03-16</dateraised>
                            <text>I, GLENDA MANX, am a Callcredit test record and have no identity.  Please do not lend me money as I do not exist</text>
                            <name>MRS GLENDA MANX</name>
                            <address current="1">606 ALLEY CAT LANE, TEST TOWN X9 9AA</address>
                          </noc>
                        </nocs>
                        <searches/>
                        <addresslinks>
                          <addresses>
                            <address addressid="1" current="0" declared="0" undeclaredaddresstype="2">608 ALLEY CAT LANE, TEST TOWN, X9 9AA</address>
                            <address addressid="2" current="1" declared="1">606 ALLEY CAT LANE, TEST TOWN, X9 9AA</address>
                          </addresses>
                          <links>
                            <link from="2" to="1">
                              <creationdate>2004-01-01</creationdate>
                              <lastconfdate>2004-01-01</lastconfdate>
                              <supplierdetails>
                                <suppliertypecode>CA</suppliertypecode>
                              </supplierdetails>
                            </link>
                          </links>
                        </addresslinks>
                        <aliaslinks>
                          <aliaslink declared="0">
                            <name>MRS GLENDA TEST-PERSON BURMESE</name>
                            <alias>MRS GLENDA MANX</alias>
                            <creationdate>2004-01-01</creationdate>
                            <lastconfdate>2004-01-01</lastconfdate>
                            <supplierdetails>
                              <suppliertypecode>CA</suppliertypecode>
                            </supplierdetails>
                          </aliaslink>
                        </aliaslinks>
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
