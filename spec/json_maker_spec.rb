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
            creditscore: "513",
            forename: "Bob", surname: "Smith", dob: "09 June 1966",
            dead_or_alive: "not found in the database of death records",
            addresses: ["11 THE PARK, TREHARRIS CF46 5RH", "11 MANOR COURT, EDWARDSVILLE, TREHARRIS CF46 5NZ", "10 ALEXANDRA ROAD, TREFOREST, PONTYPRIDD CF37 1BN", "8 SARON STREET, PONTYPRIDD CF37 1TF", "37 OXFORD STREET, PONTYPRIDD CF37 1RU"],
            electoral_roll: "on electoral roll at the given address",
            ccj: {:active=>"0", :satisfied=>"0"},
            bankruptcy: {:discharged=>"0", :insolvent=>"1", :restricted=>"0"},
            financial_risk: "Highest Risk",
            income_type: "Poorer Terraced Communities",
            investor_category: "Terrace Residents",
            property_value: "between £103,569 and £113,489",
            area_makeup: "Mixed Households In Mostly Welsh Suburban Communities & Rural Areas"
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
          creditscore: "9999",
          forename: "Mike", surname: "Smith", dob: "13 October 1944",
          dead_or_alive: "not found in the database of death records",
          addresses: ["none found"],
          electoral_roll: "not on electoral roll at the given address",
          ccj: {:active=>"0", :satisfied=>"0"},
          bankruptcy: {:discharged=>"0", :insolvent=>"0", :restricted=>"0"},
          financial_risk: "N/A",
          income_type: "N/A",
          investor_category: "N/A",
          property_value: "N/A",
          area_makeup: "N/A"
        }
      end

      it "should turn them into sensible JSON" do
        json.should eq expected
      end
    end

    context "when a person searched has a CCJ" do
      let(:xml) { person_with_ccj }
      let(:json) { CallCredit::JSONmaker.parse(xml) }
      let(:expected) do
        {
          creditscore: "506",
          forename: "Elizabeth", surname: "Tabby", dob: "02 January 1986",
          dead_or_alive: "not found in the database of death records",
          addresses: ["606 ALLEY CAT LANE, TEST TOWN X9 9AA"],
          electoral_roll: "on electoral roll at the given address",
          ccj: {:active=>"1", :satisfied=>"0"},
          bankruptcy: {:discharged=>"0", :insolvent=>"0", :restricted=>"0"},
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
