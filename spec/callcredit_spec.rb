require 'spec_helper'

describe CallCredit do

  let(:cc) { CallCredit.new }

  describe "#client" do
    it "should be available" do
      cc.client.should be_kind_of Savon::Client
    end
  end

  pending "#address" do
    let(:address) { cc.address(number: 2, postcode: "XY") }
    it "should derive from Address" do
      cc.address.should be_kind_of Address
    end
  end

  describe "#add_address" do
    it "should have the method" do
      cc.should respond_to :add_address
    end

    context "when an address is added" do
      before { cc.add_address(number: 7, postcode: "QP") }

      it "should return an Array with the address" do
        cc.addresses.should eq [{ number: 7, postcode: "QP" }]
      end
    end

    context "when multiple addresses are added" do
      before do
        cc.add_address(number: 7, postcode: "QP")
        cc.add_address(number: 8, postcode: "RT")
        cc.add_address(number: 9, postcode: "D2")
      end

      let(:all_addresses) do
        [{ number: 7, postcode: "QP" },
         { number: 8, postcode: "RT" },
         { number: 9, postcode: "D2" }]
      end

      it "should return an Array with all the addresses" do
        cc.addresses.should eq all_addresses
      end
    end

    context "when a non valid attribute is added" do
      it "should return an error" do
        expect { cc.add_address(ninja: 7) }.to raise_error StandardError
      end
    end

    context "when more than 10 addresses are added" do
      before { 10.times { cc.add_address(number: 7, postcode: "QP") } }

      it "should fail" do
        expect { cc.add_address(number: 7, postcode: "QP")  }.to raise_error StandardError
      end
    end

  end

  describe "#person" do
    it "should derive from Person" do
      cc.person.should be_kind_of Person
    end
  end

  describe "configuration" do
    it "should have configuration options" do
      cc.conf.should be_kind_of ConfigEnv
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
