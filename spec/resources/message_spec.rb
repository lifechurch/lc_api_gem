require 'spec_helper'

describe LcApi::Message do
  describe "returning all messages" do
    it "should grab a collection of messages" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/messages.json?key=1111", :body => [{id: 1}].to_json)
      @messages = LcApi::Message.find(:all)
      expect(@messages.class).to eq ActiveResource::Collection
    end
  end

  describe "returning a single message" do
    it "should return a message" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/messages/2.json?key=1111", :body => {id: 1, foo: "bar"}.to_json)
      @message = LcApi::Message.find(2)
      expect(@message.class).to eq LcApi::Message
    end
  end

  describe "including the series info" do
    it "should include 'series' in the url" do
      # If this test passes, that means the url below was correctly called, no need for any expects
      FakeWeb.register_uri(:get, "#{SITE_URL}/messages/2.json?include=series&key=1111", :body => {id: 1, foo: "bar"}.to_json)
      LcApi::Message.find(2, include: [:series])
    end
  end

  describe "including the speaker info" do
    it "should include 'speaker' in the url" do
      # If this test passes, that means the url below was correctly called, no need for any expects
      FakeWeb.register_uri(:get, "#{SITE_URL}/messages/2.json?include=speaker&key=1111", :body => {id: 1, foo: "bar"}.to_json)
      LcApi::Message.find(2, include: [:speaker])
    end
  end
end