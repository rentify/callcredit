require 'spec_helper'

describe Address do
  let(:person) { Address.new }

  it "should have a number" do
    person.should respond_to :number
  end

  it "should have a postcode" do
    person.should respond_to :postcode
  end
end
