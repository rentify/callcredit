require 'spec_helper'

describe Person do
  let(:person) { Person.new }

  it "should have a forename" do
    person.should respond_to :forename
  end

  it "should have a surname" do
    person.should respond_to :surname
  end

  it "should have a DOB" do
    person.should respond_to :dob
  end
end
