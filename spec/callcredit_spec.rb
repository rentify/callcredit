require 'spec_helper'

describe CallCredit do

  let(:cc) { CallCredit::Search.new }

  before do
    CallCredit.configure do |config|
      config.company = 'company'
      config.username = 'username'
      config.password = 'password'
    end

    $logger = double('logger')
    allow($logger).to receive(:info)
    allow($logger).to receive(:debug)
  end

  describe "#client" do
    it "should be available" do
      cc.client.should be_kind_of Savon::Client
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
        expect { cc.add_address(ninja: 7) }.to raise_error CallCredit::AddressError
      end
    end

    context "when more than 10 addresses are added" do
      before { 10.times { cc.add_address(number: 7, postcode: "QP") } }

      it "should fail" do
        expect { cc.add_address(number: 7, postcode: "QP")  }.to raise_error CallCredit::AddressError
      end
    end
  end

  describe "#people" do
    let(:cc) { CallCredit::Search.new }

    specify { cc.people.should be_kind_of Array }
  end

  describe "#add_person" do
    it "should have the method defined" do
      cc.should respond_to :add_person
    end

    context "when a person is added" do
      before { cc.add_person(forename: "Julia", surname: "Audi", dob: "1943-03-06") }

      it "should return an Array with the person" do
        cc.people.should eq [{ forename: "Julia", surname: "Audi", dob: "1943-03-06" }]
      end
    end

    context "when more than 2 people are added" do
      before do
        cc.add_person(forename: "Julia", surname: "Audi", dob: "1943-03-06")
        cc.add_person(forename: "Romeo", surname: "Audi", dob: "1941-03-06")
      end

      let(:all_addresses) do
        [{ forename: "Julia", surname: "Audi", dob: "1943-03-06" },
         { forename: "Romeo", surname: "Audi", dob: "1941-03-06" }]
      end

      it "should throw an error" do
        expect {
          cc.add_person(forename: "Sven", surname: "Flip", dob: "1943-03-06")
        }.to raise_error CallCredit::PersonError
      end
    end

    context "when a non valid attribute is added" do
      it "should return an error" do
        expect { cc.add_person(made_up: "irrelevant value") }.to raise_error CallCredit::PersonError
      end
    end

  end

  describe "configuration" do
    it "should have configuration options" do
      pending
    end
  end

  describe "#search" do
    it "should be defined" do
      cc.should respond_to :search
    end

    context "when a query is submitted" do
      let!(:cc) { CallCredit::Search.new }
      let!(:person) { cc.add_person(forename: "Julia", surname: "Audi", dob: "1943-03-06") }
      let!(:address) { cc.add_address(number: 7, postcode: "W1") }

      subject { cc.search }

      it "should return the results", :vcr do
        subject.should be_kind_of Hash
      end
    end

    context "when a person is added only" do
      let(:cc) { CallCredit::Search.new }

      it "should raise an error" do
        expect { cc.search }.to raise_error CallCredit::NoPersonError
      end
    end

    context "when no address is added" do
      let!(:cc) { CallCredit::Search.new }
      let!(:person) { cc.add_person(forename: "Julia", surname: "Audi", dob: "1943-03-06") }

      it "should raise an error" do
        expect { cc.search }.to raise_error CallCredit::NoAddressError
      end
    end
  end
end
