require 'spec_helper'

describe LcApi do
  it "should set the key" do
    LcApi.key = "1111"
    expect(LcApi.key).to eq "1111"
  end  

  it "should set the site" do
    expect(LcApi::Base.site.to_s).to eq SITE_URL
  end
end