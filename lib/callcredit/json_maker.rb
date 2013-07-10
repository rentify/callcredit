# -*- coding: utf-8 -*-

class JSONmaker
  def self.parse(hash)
    forename = hash[:search07a_response][:search_result][:creditrequest][:applicant][:name][:forename]
    surname = hash[:search07a_response][:search_result][:creditrequest][:applicant][:name][:surname]
    dob_format = "%d %B %Y"
    dob = hash[:search07a_response][:search_result][:creditrequest][:applicant][:dob].strftime(dob_format)

    addresses = get_address(hash)

    ccj = get_ccj(hash)

    bankruptcy = get_bankruptcy(hash)

    begin
      demographic = hash[:search07a_response][:search_result][:creditreport][:applicant][:demographics2006]
      financial_risk = get_financial_risk demographic[:cameofing]
      income_type = get_income_type demographic[:cameoincome]
      investor_category = get_investor demographic[:cameoinvestor]
      property_value = get_property_value demographic[:cameoproperty]
      area_makeup = get_area_makeup demographic[:cameouk]
    rescue NoMethodError
      financial_risk = "N/A"
      income_type = "N/A"
      investor_category = "N/A"
      property_value = "N/A"
      area_makeup = "N/A"
    end

    { forename: forename, surname: surname, dob: dob,
      addresses: addresses,
      ccj: ccj,
      bankruptcy: bankruptcy,
      financial_risk: financial_risk,
      income_type: income_type,
      investor_category: investor_category,
      property_value: property_value,
      area_makeup: area_makeup }
  end

  private

  def self.get_address hash
    begin
      addresses = hash[:search07a_response][:search_result][:picklist][:applicant][:address][:fullmatches][:@reporttype]
      if addresses == "0"
        addresses = ["none found"]
      else
        addresses = hash[:search07a_response][:search_result][:creditreport][:applicant][:summary][:address]
        if addresses.class == String
          [addresses]
        else
          addresses
        end
      end
    rescue NoMethodError
      addresses = ["none found"]
    end
  end

  def self.get_ccj hash
    begin
      ccj = hash[:search07a_response][:search_result][:creditreport][:applicant][:summary][:judgments]
      if ccj.has_key? :totalactiveamount
        { total_active: ccj[:totalactive], total_satisfied: ccj[:totalsatisfied], total_value: ccj[:totalactiveamount] }
      else
        "none"
      end
    rescue NoMethodError
      "none"
    end
  end

  def self.get_bankruptcy hash
    insolvency = {
      "A" => "Active",
      "D" => "Discharged or completed",
      "V" => "Revoked"
    }
    begin
      bais = hash[:search07a_response][:search_result][:creditreport][:applicant][:bais]
      courtname = bais[:bai][:courtname]
      case_number = bais[:bai][:caseref]
      discharge_date = bais[:bai][:orderdate]
      status = insolvency[bais[:bai][:currentstatus]]
      { courtname: courtname, case_number: case_number, discharge_date: discharge_date, status: status }
    rescue NoMethodError
      "none"
    end
  end

  def self.get_financial_risk key
    cameofing = {
      "1" => "Lowest Risk",
      "2" => "Very Low Risk",
      "3" => "Low Risk",
      "4" => "Below Average Risk",
      "5" => "Average Risk",
      "6" => "Above Average Risk",
      "7" => "Highest Risk"
    }

    cameofing[key]
  end

  def self.get_income_type key
    cameoincome = {
      "11" => "Opulent Families & Couples",
      "12" => "Professional Detached Homeowners",
      "13" => "Retired Flat Dwellers",
      "14" => "Affluent Mixed Neighbourhoods",
      "15" => "Wealthy Terraced Households",
      "16" => "Affluent Young Professionals",
      "21" => "Affluent Families & Couples",
      "22" => "Older Professional Families",
      "23" => "Retired Professionals",
      "24" => "Mixed Occupancy Flats",
      "25" => "Home Owning Managers & Professionals",
      "26" => "Educated Couples & Singles",
      "31" => "Home Owning Families & Couples",
      "32" => "Professional Detached Neighbourhoods",
      "33" => "Accomplished Retirees",
      "34" => "Well-Off Flat Tenants",
      "35" => "Professional Terraced Residents",
      "36" => "Young Managers & Professionals",
      "41" => "Comfortable Families & Couples",
      "42" => "Managers & Professionals In Detached Homes",
      "43" => "Retired Homeowners",
      "44" => "Aspiring Households In Mixed Neighbourhoods",
      "45" => "Comfortable Terraced Neighbourhoods",
      "46" => "Professional Singles & Cohabitees",
      "51" => "Middle-Aged Families & Couples",
      "52" => "Families & Couples In Detached Housing",
      "53" => "Retired Flat Tenants",
      "54" => "Flat Dwelling Families",
      "55" => "Terraced Homeowners",
      "56" => "Young Professional Flat Dwellers",
      "61" => "Families In Semi-Detached Areas",
      "62" => "Older Detached Neighbourhoods",
      "63" => "Less Affluent Retired Households",
      "64" => "Lower Income Tenants",
      "65" => "Less Affluent Terraced Homeowners",
      "66" => "Couples & Singles In Flats",
      "71" => "Lower Skilled Families & Couples",
      "72" => "Poorer Detached Homeowners",
      "73" => "Retirees In Less Affluent Areas",
      "74" => "Lower Class Families",
      "75" => "Poorer Terraced Communities",
      "76" => "Young Professionals In Student Areas",
      "81" => "Lower Income Older Families",
      "82" => "Poorer Owner Occupiers",
      "83" => "Retired Council Flat Tenants",
      "84" => "Lower Class Council Neighbourhoods",
      "85" => "Lower Income Terraced Households",
      "86" => "Couples & Singles In Rented Accommodation",
      "XX" => "Communal Establishments In Mixed Neighbourhoods"
    }
    cameoincome[key]
  end

  def self.get_investor key
    cameoinvestor = {
      "11" => "Older Semi-Detached Neighbourhoods",
      "12" => "Wealthy Professional Households",
      "13" => "Older & Retired Professionals",
      "14" => "City Flat Dwellers",
      "15" => "Terraced Homeowners",
      "16" => "Young Professionals",
      "21" => "Affluent Homeowners",
      "22" => "Affluent Professionals",
      "23" => "Retired Households",
      "24" => "Urban Flat Dwellers",
      "25" => "Young & Middle-Aged",
      "26" => "Single Professionals",
      "31" => "Comfortable Homeowners",
      "32" => "Prosperous Mortgagees",
      "33" => "Mature Educated Couples",
      "34" => "Poorer Flat Dwellers",
      "35" => "Comfortable Terrace Residents",
      "36" => "Young Professional Tenants",
      "41" => "Home Owning Families",
      "42" => "Affluent Families & Couples",
      "43" => "Retired Professionals",
      "44" => "Young Council Tenants",
      "45" => "Terrace Residents",
      "46" => "Young & Educated",
      "51" => "Less Affluent Homeowners",
      "52" => "Managers & Professionals",
      "53" => "Elderly Households",
      "54" => "Council Tenants",
      "55" => "Mature Terraced Neighbourhoods",
      "56" => "Young Educated Singles",
      "61" => "Lower Skilled Families",
      "62" => "Well-Off Homeowners",
      "63" => "Council Flat Retirees",
      "64" => "Poorer Council Tenants",
      "65" => "Poorer Terraced Households",
      "66" => "Professional Single Tenants",
      "71" => "Poorly Educated Families",
      "72" => "Prosperous Mature Homeowners",
      "73" => "Retired Council Tenants",
      "74" => "Poorer Council Neighbourhoods",
      "75" => "Lower Skilled Terrace Residents",
      "76" => "Young Educated Neighbourhoods",
      "XX" => "Communal Establishments In Mixed Neighbourhoods"
    }
    cameoinvestor[key]
  end

  def self.get_property_value key
    cameoproperty = {
      "01" => "between £836,507 and upwards",
      "02" => "between £662,759 and £836,498",
      "03" => "between £576,154 and £662,757",
      "04" => "between £520,726 and £576,153",
      "05" => "between £480,618 and £520,725",
      "06" => "between £370,725 and £480,614",
      "07" => "between £315,381 and £370,724",
      "08" => "between £278,665 and £315,380",
      "09" => "between £251,913 and £278,664",
      "10" => "between £230,245 and £251,912",
      "11" => "between £211,808 and £230,244",
      "12" => "between £195,684 and £211,807",
      "13" => "between £181,216 and £195,683",
      "14" => "between £168,175 and £181,215",
      "15" => "between £156,139 and £168,174",
      "16" => "between £144,881 and £156,138",
      "17" => "between £134,086 and £144,880",
      "18" => "between £123,668 and £134,085",
      "19" => "between £113,490 and £123,667",
      "20" => "between £103,569 and £113,489",
      "21" => "between £93,635 and £113,568",
      "22" => "between £83,256 and £93,634",
      "23" => "between £71,236 and £83,255",
      "24" => "between £0 and £71,235"
    }

    cameoproperty[key]
  end

  def self.get_area_makeup key
    cameouk = {
      "01A" => "Opulent Couples & Singles In Executive City & Suburban Areas",
      "01B" => "Wealthy Singles In Small City Flats & Suburban Terraces",
      "01C" => "Urban Living Professional Singles & Couples",
      "01D" => "Wealthy & Educated Singles In Student Areas",
      "02A" => "Opulent Older & Retired Households In Spacious Rural Properties",
      "02B" => "Affluent Mature Families & Couples In Large Exclusive Detached Homes",
      "02C" => "Affluent Mature Couples & Singles Some With School Age Children",
      "02D" => "Wealthy Suburban Professionals In Mixed Tenure",
      "03A" => "Wealthy Older Families In Spacious Suburban & Rural Detached & Semis",
      "03B" => "Young & Mature Couples & Families In Large Rural Dwellings",
      "03C" => "Well-Off Older Couples & Families In Large Detached & Semis",
      "03D" => "Wealthy Mixed Households Living In Rural Communities",
      "04A" => "Executive Households In Suburban Terraces & Semis",
      "04B" => "Professional Homeowners In Detached & Semi Suburbia",
      "04C" => "White Collar Homeowners In Outer Suburbs & Coastal Areas",
      "04D" => "Mature Owner Occupiers In Rural & Coastal Neighbourhoods",
      "04E" => "Couples & Families In Modern Rural & Suburban Developments",
      "04F" => "Mature Couples & Families In Mortgaged Detached & Semis",
      "05A" => "Singles, Couples & School Age Families In Mixed Housing",
      "05B" => "Young & Older Single Mortgagees & Renters In Terraces & Flats",
      "05C" => "Mature & Retired Singles In Areas Of Small Mixed Housing",
      "05D" => "Young & Older Households In Coastal, Rural & Suburban Areas",
      "05E" => "Mature Households In Scottish Industrial Suburbs & Rural Communities",
      "05F" => "Young & Older Households In Areas Of Mixed Tenure",
      "05G" => "Older Couples & Singles In Suburban Family Semis",
      "06A" => "Less Affluent Communities In Areas Of Mixed Tenure",
      "06B" => "Older & Mature Households In Suburban Semis & Terraces",
      "06C" => "Mixed Households In Mostly Welsh Suburban Communities & Rural Areas",
      "06D" => "Couples & Families With School Age & Older Children In Spacious Semis",
      "06E" => "Mature Households In Less Affluent Suburban & Rural Areas",
      "06F" => "Less Affluent Couples In Suburban Family Neighbourhoods",
      "06G" => "Young Single & Family Communities In Small Terraces & Rented Flats",
      "07A" => "Single Mortgagees & Renters In Pre-School Family Neighbourhoods",
      "07B" => "Singles & Families In Ethnically Mixed Inner City & Suburban Areas",
      "07C" => "Young Flat Dwelling Singles & Couples In Inner City Student Areas",
      "07D" => "Young Singles, Couples & Students In Urban Areas",
      "07E" => "Young Singles In Privately Rented & Housing Association Properties",
      "08A" => "Poorer Retired Households In Owned & Rented Accommodation",
      "08B" => "Older & Mature Households In Suburban Areas Of Mixed Tenure",
      "08C" => "Older Households With School Age Children In Towns & Suburbs",
      "08D" => "Poorer Young Singles In Suburban Family Areas",
      "08E" => "Mixed Mortgagees & Council Tenants In Outer Suburbs",
      "08F" => "Singles & Couples In Small Terraced Properties",
      "09A" => "Poorer Singles In Outer Suburban Family Neighbourhoods",
      "09B" => "Poorer Singles & Families In Mixed Tenure",
      "09C" => "Suburban Scottish Households In Small Terraces & Flats",
      "09D" => "Ethnically Mixed Young Families & Singles In Terraced Housing",
      "09E" => "Poorer Couples & School Age Families In Terraced & Semis",
      "09F" => "Flat Dwellers In Council & Housing Association Accommodation",
      "09G" => "Young & Older Households In Housing Association & Mortgaged Homes",
      "10A" => "Hi-Rise Flat Dwellers In Cosmopolitan Areas Of Mixed Tenure",
      "10B" => "Council Tenants & Mortgagees In Scottish Suburbia",
      "10C" => "Poorer Mortgagees & Council Renters In Family Neighbourhoods",
      "10D" => "Singles & Single Parents In Suburban Hi-Rise Flats",
      "10E" => "Mature Households In Small Terraces & Semis",
      "10F" => "Poorer Singles In Local Authority Family Neighbourhoods",
      "10G" => "Single Renters In Mixed Age Hi-Rise Communities",
      "XXX" => "Communal Establishments In Mixed Neighbourhoods"
    }

    cameouk[key]
  end
end
