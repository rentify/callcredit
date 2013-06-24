require 'spec_helper'

describe Address do
  context "when no parameters are passed" do
    let(:address) { Address.new }

    it "should be valid" do
      address.should be_kind_of Address
    end
  end

  context "when parameters are provided" do
    let(:address) { Address.new(number: 7, postcode: "SW1") }

    it "should have a number" do
      address.number.should eq 7
    end

    it "should have a postcode" do
      address.postcode.should eq "SW1"
    end
  end
end
