
class JSONmaker
  def self.parse(hash)
    forename = hash[:search07a_response][:search_result][:creditrequest][:applicant][:name][:forename]
    surname = hash[:search07a_response][:search_result][:creditrequest][:applicant][:name][:surname]
    dob = hash[:search07a_response][:search_result][:creditrequest][:applicant][:dob]
    addresses = hash[:search07a_response][:search_result][:creditreport][:applicant][:summary][:address]

    # demographic
    demographic = hash[:search07a_response][:search_result][:creditreport][:applicant][:demographics2006]
    financial_risk = demographic[:cameofing] || "not found"
    income_type = demographic[:cameoincome]
    investor_category = demographic[:cameoinvestor]
    property_value = demographic[:cameoproperty]
    area_makeup = demographic[:cameouk]

    { forename: forename, surname: surname, dob: dob, addresses: addresses,
      financial_risk: get_financial_risk(financial_risk),
      income_type: get_income_type(income_type),
      investor_category: get_investor(investor_category) }
  end

  private
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
end
