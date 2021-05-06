# -*- coding: utf-8 -*-
require 'spec_helper'

describe CallCredit::JSONmaker do

  describe ".parse" do
    specify { CallCredit::JSONmaker.should respond_to :parse }

    context "when all the required fields are present" do
      context "when given a Hash of values" do
        let(:xml) { person_xml }
        let(:json) { CallCredit::JSONmaker.parse(xml) }
        let(:expected) do
          {
            creditscore: "605",
            forename: "GLENDA", surname: "BURMESE", dob: "15 June 1962",
            dead_or_alive: "Not found in the database of death records",
            addresses: ["608 ALLEY CAT LANE, TEST TOWN X9 9AA", "606 ALLEY CAT LANE, TEST TOWN X9 9AA"],
            electoral_roll: "Person known on Electoral Roll",
            ccj: {:active=>"0", :satisfied=>"1"},
            bankruptcy: {:discharged=>"0", :insolvent=>"1", :restricted=>"0"},
            financial_risk: "Low Risk",
            income_type: "Accomplished Retirees",
            investor_category: "Mature Educated Couples",
            property_value: "between £278,665 and £315,380",
            area_makeup: "Couples & Families In Modern Rural & Suburban Developments"
          }
        end

        it "should turn them into JSON" do
          json.should eq expected
        end
      end
    end

    context "when all the required fields are not present" do
      let(:xml) { person_xml_with_missing_fields }
      let(:json) { CallCredit::JSONmaker.parse(xml) }
      let(:expected) do
        {
          creditscore: "0",
          forename: "", surname: "", dob: nil,
          dead_or_alive: "Not found in the database of death records",
          addresses: ["606 ALLEY CAT LANE, TEST TOWN X9 9AA"],
          electoral_roll: "Person not known on Electoral Roll",
          ccj: {:active=>"0", :satisfied=>"0"},
          bankruptcy: {:discharged=>"0", :insolvent=>"0", :restricted=>"0"},
          financial_risk: "Low Risk",
          income_type: "Accomplished Retirees",
          investor_category: "Mature Educated Couples",
          property_value: "between £278,665 and £315,380",
          area_makeup: "Couples & Families In Modern Rural & Suburban Developments"
        }
      end

      it "should turn them into sensible JSON for address only match" do
        json.should eq expected
      end
    end

    context "when a person searched has a CCJ" do
      let(:xml) { person_with_ccj }
      let(:json) { CallCredit::JSONmaker.parse(xml) }
      let(:expected) do
        {
          creditscore: "604",
          forename: "FRED", surname: "MANX", dob: "10 October 1930",
          dead_or_alive: "Not found in the database of death records",
          addresses: ["606 ALLEY CAT LANE, TEST TOWN X9 9AA"],
          electoral_roll: "Person formally known on Electoral Roll",
          ccj: {:active=>"0", :satisfied=>"1"},
          bankruptcy: {:discharged=>"0", :insolvent=>"1", :restricted=>"0"},
          financial_risk: "Low Risk",
          income_type: "Accomplished Retirees",
          investor_category: "Mature Educated Couples",
          property_value: "between £278,665 and £315,380",
          area_makeup: "Couples & Families In Modern Rural & Suburban Developments"
        }
      end

      it "should turn them into correct JSON" do
        json.should eq expected
      end
    end
  end
end
