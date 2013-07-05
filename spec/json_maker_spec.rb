# -*- coding: utf-8 -*-
require 'spec_helper'

describe JSONmaker do

  describe ".parse" do
    specify { JSONmaker.should respond_to :parse }

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
          property_value: "between £103,569 and £113,489"
        }
      end

      it "should turn them into JSON" do
        json.should eq expected
      end
    end
  end
end
