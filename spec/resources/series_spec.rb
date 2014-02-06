require 'spec_helper'

describe LcApi::Series do
  describe "returning all series" do
    it "should grab a collection of series" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/series.json?key=1111", :body => [{id: 1}].to_json)
      @series = LcApi::Series.find(:all)
      expect(@series.class).to eq ActiveResource::Collection
    end
  end

  describe "returning a single series" do
    it "should return a series" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/series/2.json?key=1111", :body => {id: 1, foo: "bar"}.to_json)
      @series = LcApi::Series.find(2)
      expect(@series.class).to eq LcApi::Series
    end
  end

  describe "including the messages info" do
    it "should include 'messages' in the url" do
      # If this test passes, that means the url below was correctly called, no need for any expects
      FakeWeb.register_uri(:get, "#{SITE_URL}/series/2.json?include=messages&key=1111", :body => {id: 1, foo: "bar"}.to_json)
      LcApi::Series.find(2, include: [:messages])
    end
  end
end