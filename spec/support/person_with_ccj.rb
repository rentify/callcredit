
def person_with_ccj
  '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><Search07aResponse xmlns="urn:callcredit.co.uk/soap:callreport7"><SearchResult><jobdetails><searchid>{FF462FAD-3DF3-4756-80BA-5BED25AF34A6}</searchid><cast>02.01.7.1.4.1.41389.13971446.260240</cast><pstv>13971446</pstv><ls>41389</ls><searchdate>2013-07-25T09:37:09</searchdate></jobdetails><creditrequest schemaversion="7.0" datasets="255"><applicant><address><buildingno>606</buildingno><postcode>X9 9AA</postcode></address><name><forename>Elizabeth</forename><surname>Tabby</surname></name><dob>1986-01-02</dob><hho>0</hho><tpoptout>1</tpoptout><applicantdemographics><employment /></applicantdemographics></applicant><score>1</score><purpose>TV</purpose><autosearch>1</autosearch><autosearchmaximum>4</autosearchmaximum></creditrequest><picklist maxaddressitems="20" maxnameitems="9" picklist="1" regenerated="0"><applicant id="1" reporttype="3"><address addressid="1"><addressinput><abodeno /><buildingno>606</buildingno><buildingname /><street1 /><street2 /><sublocality /><locality /><posttown /><postcode>X9 9AA</postcode></addressinput><fullmatches reporttype="3" matchstatus="2"><fullmatch selected="1"><addressmatch><buildingno>606</buildingno><street1>ALLEY CAT LANE</street1><posttown>TEST TOWN</posttown><postcode>X9 9AA</postcode><domicileid>35241397</domicileid></addressmatch><name nameid="1"><nameinput><title /><forename>Elizabeth</forename><othernames /><surname>Tabby</surname></nameinput><namematches reporttype="3" matchstatus="2"><namematch selected="1"><title>MISS</title><forename>ELIZABETH</forename><othernames>TEST-PERSON</othernames><surname>TABBY</surname><residenceid>148488399</residenceid><dob>1986-01-02</dob></namematch></namematches></name></fullmatch></fullmatches></address></applicant></picklist><creditreport searchid="{FF462FAD-3DF3-4756-80BA-5BED25AF34A6}" linktype="0"><applicant reporttype="3" tpoptout="1" autosearchmaxexceeded="0" ageflag="0" reporttitle="ELIZABETH TEST-PERSON TABBY "><summary><searches><totalsearches3months>0</totalsearches3months><totalsearches12months>0</totalsearches12months><totalhomecreditsearches3months>0</totalhomecreditsearches3months></searches><judgments><totalactive>1</totalactive><totalsatisfied>0</totalsatisfied><totalactiveamount>2222</totalactiveamount></judgments><bais><totaldischarged>0</totaldischarged><currentlyinsolvent>0</currentlyinsolvent><restricted>0</restricted></bais><notices><nocflag>0</nocflag><totaldisputes>0</totaldisputes></notices><links><totalundecaddressessearched>0</totalundecaddressessearched><totalundecaddressesunsearched>0</totalundecaddressesunsearched><totalundecaliases>0</totalundecaliases></links><summaryaddress><pafvalid>1</pafvalid><rollingroll>0</rollingroll><messagecode>1</messagecode></summaryaddress><address current="1" messagecode="1" id="1">606 ALLEY CAT LANE, TEST TOWN X9 9AA</address></summary><creditscore><score class="2">506</score><reasons><code>203</code><code>204</code><code>401</code><code>302</code></reasons></creditscore><addressconfs><addressconf pafvalid="1"><address current="1">606 ALLEY CAT LANE, TEST TOWN X9 9AA</address><resident matchtype="IM" currentname="1" declaredalias="0"><name>ELIZABETH TEST-PERSON TABBY</name><duration>P19M</duration><startdate>2011-12-25</startdate><ervalid>1</ervalid><erhistory><startdate>2011-12-25</startdate><optout>0</optout><rollingroll>0</rollingroll></erhistory></resident><resident matchtype="HM" currentname="0" declaredalias="0"><name>GLENDA MANX</name><duration>P7M</duration><startdate>2012-12-25</startdate><ervalid>1</ervalid><erhistory><startdate>2012-12-25</startdate><optout>0</optout><rollingroll>0</rollingroll></erhistory></resident><resident matchtype="HM" currentname="0" declaredalias="0"><name>GLENDA TEST-PERSON BURMESE</name><duration>P12M</duration><startdate>2011-12-25</startdate><enddate>2012-12-25</enddate><ervalid>3</ervalid><erhistory><startdate>2011-12-25</startdate><enddate>2012-12-25</enddate><optout>0</optout><rollingroll>0</rollingroll></erhistory></resident><resident matchtype="HM" currentname="0" declaredalias="0"><name>FRED TEST-PERSON MANX</name><duration>P108M</duration><startdate>2003-12-25</startdate><enddate>2012-12-25</enddate><ervalid>3</ervalid><erhistory><startdate>2003-12-25</startdate><enddate>2012-12-25</enddate><optout>0</optout><rollingroll>0</rollingroll></erhistory></resident></addressconf></addressconfs><judgments><judgment><name>MISS ELIZABETH TABBY</name><address current="1">606 ALLEY CAT LANE X9 9AA</address><courtname>TESTTOWN</courtname><courttype>0</courttype><casenumber>TEST 7825220</casenumber><status>JG</status><amount>2222</amount><judgmentdate>2012-08-14</judgmentdate></judgment></judgments><bais /><searches /><addresslinks /><aliaslinks /><demographics2006><cameouk>04E</cameouk><cameoincome>33</cameoincome><cameoinvestor>33</cameoinvestor><cameoproperty>08</cameoproperty><cameofing>3</cameofing><property><ctaxband>G</ctaxband><priceindex>8065</priceindex></property></demographics2006></applicant></creditreport></SearchResult></Search07aResponse></soap:Body></soap:Envelope>'
end
