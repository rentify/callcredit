# -*- coding: utf-8 -*-
require 'spec_helper'

describe JSONmaker do

  describe ".parse" do
    specify { JSONmaker.should respond_to :parse }

    context "when all the required fields are present" do
      context "when given a Hash of values" do
        let(:hash) { person_hash }
        let(:json) { JSONmaker.parse(hash) }
        let(:expected) do
          {
            forename: "Bob", surname: "Smith", dob: "09 June 1966",
            addresses: ["11 THE PARK, TREHARRIS CF46 5RH", "11 MANOR COURT, EDWARDSVILLE, TREHARRIS CF46 5NZ", "10 ALEXANDRA ROAD, TREFOREST, PONTYPRIDD CF37 1BN", "8 SARON STREET, PONTYPRIDD CF37 1TF"],
            ccj: "none",
            bankruptcy: { courtname: "MERTHYR TYDFIL", case_number: "0000094", discharge_date: "2012-11-09", status: "Active" },
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
      let(:hash) { person_hash_with_missing_fields }
      let(:json) { JSONmaker.parse(hash) }
      let(:expected) do
        {
          forename: "Mike", surname: "Smith", dob: "09 June 1976",
          addresses: ["none found"],
          ccj: "none",
          bankruptcy: "none",
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
      let(:hash) { person_with_ccj }
      let(:json) { JSONmaker.parse(hash) }
      let(:expected) do
        {
          forename: "Elizabeth", surname: "Tabby", dob: "02 January 1986",
          addresses: "606 ALLEY CAT LANE, TEST TOWN X9 9AA",
          ccj: { total_active: "1", total_satisfied: "0", total_value: "2222" },
          bankruptcy: "none",
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
