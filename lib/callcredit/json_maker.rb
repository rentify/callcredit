
class JSONmaker
  def self.parse(hash)
    forename = hash[:search07a_response][:search_result][:creditrequest][:applicant][:name][:forename]
    surname = hash[:search07a_response][:search_result][:creditrequest][:applicant][:name][:surname]
    dob = hash[:search07a_response][:search_result][:creditrequest][:applicant][:dob]
    addresses = hash[:search07a_response][:search_result][:creditreport][:applicant][:summary][:address]

    # demographic
    demographic = hash[:search07a_response][:search_result][:creditreport][:applicant][:demographics2006]
    financial_risk = demographic[:cameofing] || "not found"
    income_type = demographic[:camoeincome]
    investor_category = demographic[:cameoinvestor]
    property_value = demographic[:cameoproperty]
    area_makeup = demographic[:cameouk]

    { forename: forename, surname: surname, dob: dob, addresses: addresses,
      financial_risk: get_financial_risk(financial_risk) }
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
end
