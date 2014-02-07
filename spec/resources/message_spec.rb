require 'spec_helper'

describe LcApi::Message do
  describe "returning all messages" do
    it "should grab a collection of messages" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/messages.json?key=1111", :body => fixture('messages.json'))
      @messages = LcApi::Message.find(:all)
      expect(@messages.class).to eq ActiveResource::Collection
    end
  end

  describe "returning a single message" do
    it "should return a message" do
      FakeWeb.register_uri(:get, "#{SITE_URL}/messages/2.json?key=1111", :body => fixture('message.json'))
      @message = LcApi::Message.find(2)
      expect(@message.class).to eq LcApi::Message
    end
  end

  describe "including the series info" do
    it "should include 'series' in the url" do
      # If this test passes, that means the url below was correctly called, no need for any expects
      FakeWeb.register_uri(:get, "#{SITE_URL}/messages/2.json?include=series&key=1111", :body => fixture('message.json'))
      LcApi::Message.find(2, include: [:series])
    end
  end

  describe "including the speaker info" do
    it "should include 'speaker' in the url" do
      # If this test passes, that means the url below was correctly called, no need for any expects
      FakeWeb.register_uri(:get, "#{SITE_URL}/messages/2.json?include=speaker&key=1111", :body => fixture('message.json'))
      LcApi::Message.find(2, include: [:speaker])
    end
  end

  describe "finding different formats" do
    describe ".audio" do
      it "returns the audio format" do
        FakeWeb.register_uri(:get, "#{SITE_URL}/messages/2.json?key=1111", :body => fixture('message.json'))
        message = LcApi::Message.find(2)
        expect(message.audio.url.should).to eq "http://wistia.com/audio.mp3"
      end
    end

    describe ".high_quality_video" do
      it "returns the high quality format" do
        FakeWeb.register_uri(:get, "#{SITE_URL}/messages/2.json?key=1111", :body => fixture('message.json'))
        message = LcApi::Message.find(2)
        expect(message.high_quality_video.url).to eq("http://wistia.com/high_vid.mp4")
      end
    end

    describe ".low_quality_video" do
      it "returns the low quality format" do
        FakeWeb.register_uri(:get, "#{SITE_URL}/messages/2.json?key=1111", :body => fixture('message.json'))
        message = LcApi::Message.find(2)
        expect(message.low_quality_video.url).to eq("http://wistia.com/low_vid.mp4")
      end
    end

    describe "when a format is missing" do
      it "returns nil" do
        FakeWeb.register_uri(:get, "#{SITE_URL}/messages/2.json?key=1111", :body => fixture('message_without_audio.json'))
        message = LcApi::Message.find(2)
        expect(message.audio).to eq nil
      end
    end
  end
end