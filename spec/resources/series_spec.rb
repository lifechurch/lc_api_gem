require 'spec_helper'

describe LcApi::Series do
  describe "returning all series" do
    it "should grab a collection of series" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/series.json?key=1111", :body => fixture("seriess.json"))
      @series = LcApi::Series.find(:all)
      expect(@series.class).to eq ActiveResource::Collection
    end
  end

  describe "returning a single series by id" do
    it "should return a series" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/series/2.json?key=1111", :body => fixture("series.json"))
      @series = LcApi::Series.find(2)
      expect(@series.class).to eq LcApi::Series
    end
  end

  describe "returning a single series by slug" do
    it "should return a series" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/series/series-slug-example.json?key=1111", :body => fixture("series.json"))
      @series = LcApi::Series.find("series-slug-example")
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

  describe "filtering by type" do
    it "should include 'type=sermon' in the url" do
      # If this test passes, that means the url below was correctly called, no need for any expects
      FakeWeb.register_uri(:get, "#{SITE_URL}/series.json?type=sermon&key=1111", :body => fixture('seriess.json'))
      LcApi::Series.find(:all, type: :sermon)
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

  describe "finding different images" do
    describe ".find_image" do
      it "should find the image" do
        FakeWeb.register_uri(:get, "#{SITE_URL}/series/2.json?key=1111", :body => fixture("series.json"))
        series = LcApi::Series.find(2)
        expect(series.find_image("224x160").url).to eq "http://s3.amazonaws.com/lcapi.production/series/small-things/224x160.jpg?1391467308"
      end
    end
  end
end