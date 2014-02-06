require 'spec_helper'

describe LcApi::Location do
  describe "returning all locations" do
    it "should grab a collection of locations" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/locations.json?key=1111", :body => [{id: 1}].to_json)
      @locations = LcApi::Location.find(:all)
      expect(@locations.class).to eq ActiveResource::Collection
    end
  end

  describe "returning a single location" do
    it "should return a location" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/locations/2.json?key=1111", :body => {id: 1, foo: "bar"}.to_json)
      @location = LcApi::Location.find(2)
      expect(@location.class).to eq LcApi::Location
    end
  end

  describe "including the staff info" do
    it "should include 'staff' in the url" do
      # If this test passes, that means the url below was correctly called, no need for any expects
      FakeWeb.register_uri(:get, "#{SITE_URL}/locations/2.json?include=staff&key=1111", :body => {id: 1, foo: "bar"}.to_json)
      LcApi::Location.find(2, include: [:staff])
    end
  end

  describe "including the events info" do
    it "should include 'events' in the url" do
      # If this test passes, that means the url below was correctly called, no need for any expects
      FakeWeb.register_uri(:get, "#{SITE_URL}/locations/2.json?include=events&key=1111", :body => {id: 1, foo: "bar"}.to_json)
      LcApi::Location.find(2, include: [:events])
    end
  end
end