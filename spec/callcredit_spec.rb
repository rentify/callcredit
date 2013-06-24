require 'spec_helper'

describe CallCredit do

  let(:cc) { CallCredit.new }

  describe "#address" do
    it "should derive from Address" do
      cc.address.should be_kind_of Address
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
    end
  end
end
