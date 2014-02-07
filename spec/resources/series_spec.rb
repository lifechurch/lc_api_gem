require 'spec_helper'

describe LcApi::Series do
  describe "returning all series" do
    it "should grab a collection of series" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/series.json?key=1111", :body => fixture("seriess.json"))
      @series = LcApi::Series.find(:all)
      expect(@series.class).to eq ActiveResource::Collection
    end
  end

  describe "returning a single series" do
    it "should return a series" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/series/2.json?key=1111", :body => fixture("series.json"))
      @series = LcApi::Series.find(2)
      expect(@series.class).to eq LcApi::Series
    end
  end

  describe "including the messages info" do
    it "should include 'messages' in the url" do
      # If this test passes, that means the url below was correctly called, no need for any expects
      FakeWeb.register_uri(:get, "#{SITE_URL}/series/2.json?include=messages&key=1111", :body => fixture("series.json"))
      LcApi::Series.find(2, include: [:messages])
    end
  end

  describe "the has_many messages and the message find_format methods" do
    describe ".audio" do
      it "returns the audio format" do
        FakeWeb.register_uri(:get, "#{SITE_URL}/series/2.json?include=messages&key=1111", :body => fixture("series.json"))
        series = LcApi::Series.find(2, include: [:messages])
        expect(series.messages.first.audio.url).to eq "http://wistia.com/audio.mp3"
      end
    end
  end
end