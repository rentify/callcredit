require 'spec_helper'

describe CallCredit do

  let(:cc) { CallCredit.new }

  describe "#client" do
    it "should be available" do
      cc.client.should be_kind_of Savon::Client
    end
  end

  describe "#address" do
    let(:address) { cc.address(number: 2, postcode: "XY") }
    it "should derive from Address" do
      cc.address.should be_kind_of Address
    end
  end

  describe "#person" do
    it "should derive from Person" do
      cc.person.should be_kind_of Person
    end
  end

  describe "#search" do
    it "should be defined" do
      cc.should respond_to :search
    end

    context "when a query is submitted" do
      let!(:cc) { CallCredit.new }
      let(:person) { cc.person(forename: "Julia", surname: "Audi", dob: "1943-03-06") }
      let(:address) { cc.address(number: 7, postcode: "W1") }

      subject { cc.search }

      it "should return the results" do
        cc.search.should be_kind_of Hash
      end
    end
  end
end
