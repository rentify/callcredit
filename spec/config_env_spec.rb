require 'spec_helper'

describe ConfigEnv do
  let(:config) do
    { test:
      {
        company: "company1", userbname: "user1",
        password: "password1", wsdl: "ninja.wsdl"
      },
      production:
      {
        company: "Rent Inc", userbname: "landlordy",
        password: "secret", wsdl: "prod.wsdl"
      }
    }
  end

  context "by default" do
    let(:ce) { ConfigEnv.new }

    it "should have a default environment" do
      ce.should respond_to :env
    end

    it "should return default enviroment settings" do
      YAML.stub(:load_file).and_return config
      ce.env.should eq config[:test.to_s]
    end
  end

  context "when :production is set" do
    let(:ce) { ConfigEnv.new :production }

    it "should have a environment" do
      ce.should respond_to :env
    end

    it "should return corresponding settings" do
      YAML.stub(:load_file).and_return config
      ce.env.should eq config[:production.to_s]
    end
  end
end
