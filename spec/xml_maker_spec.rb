require 'spec_helper'

describe CallCredit::XMLmaker do
  let!(:cc) do
    cc = CallCredit::Search.new
    cc.add_address(number: 10, postcode: "X9 9LF")
    cc.add_person(forename: "Julia", surname: "Audi", dob: "1910-01-01")
    cc
  end
  let (:xml) { CallCredit::XMLmaker.person(cc) }
  let (:result) { xml_result }

  it "should create XML for a person search" do
    Hash.from_xml(xml).should eq Hash.from_xml(result)
  end
end
