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
            forename: "Bob", surname: "Smith", dob: "1966-06-09",
            addresses: ["11 THE PARK, TREHARRIS CF46 5RH", "11 MANOR COURT, EDWARDSVILLE, TREHARRIS CF46 5NZ", "10 ALEXANDRA ROAD, TREFOREST, PONTYPRIDD CF37 1BN", "8 SARON STREET, PONTYPRIDD CF37 1TF"],
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
          forename: "Mike", surname: "Smith", dob: "1976-06-09",
          addresses: ["none found"],
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
  end
end
