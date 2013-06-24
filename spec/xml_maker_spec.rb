require 'spec_helper'

describe XMLmaker do
  let!(:cc) { CallCredit.new }
  let (:xml) { XMLmaker.person(cc) }
  let (:result) { xml_result }

  it "should create XML for a person search" do
    Hash.from_xml(xml).should eq Hash.from_xml(result)
  end
end
