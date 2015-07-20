require 'spec_helper'

describe Downloader do 
  it "downloads the MacBeth file from the internet" do 
    response = "<xml>"
    stub = stub_request(:get, "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml").
      to_return(:body => response)

    file = Downloader.new

    expect(file.download).to eq response
  end
end