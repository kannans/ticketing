require "rails_helper"

RSpec.describe SymbolizeHelper  do
  include SymbolizeHelper

  context "symbolize_recursive" do
    it "should symbolize capitalized keys" do
      hash = symbolize_recursive({ "CompanyName": "test" })
      expect(hash).to eq({:company_name=>"test"})
    end

    it "should symbolize capitalized keys of deep hash" do
      hash = symbolize_recursive({ "CompanyName": "test", "Info": { "TestData": "xxx" } })

      expect(hash).to eq({:company_name=>"test", :info=>{:test_data=>"xxx"}})
    end

    it "should symbolize capitalized keys of deep array hash" do
      hash = symbolize_recursive({ "CompanyName": "test", "Info": [{ "TestData": "xxx" }] })

      expect(hash).to eq({:company_name=>"test", :info=>[{:test_data=>"xxx"}]})
    end
  end
end
