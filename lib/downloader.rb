require 'net/http'

class Downloader
  URL = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'

  def download
    Net::HTTP.get(URI.parse(URL))
  end
end