require 'spec_helper'

describe Person do
  let(:person) { per = Person.new({:forename => "Julia", :surname => "Audi", :dob => "1943-03-06", :beast => "angry"}) }

  it "should create instance variables based on parameters" do
    person.instance_variables.should include :@forename, :@surname, :@dob, :@beast
  end

  it "should have a forename" do
    person.forename.should eq "Julia"
  end

  it "should have a surname" do
      person.surname.should eq "Audi"
  end

  it "should have a DOB" do
    person.dob.should eq "1943-03-06"
  end

end
