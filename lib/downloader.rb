require 'net/http'

# Could really just be a module instead, initializing does nothing given no state is tracked.
class Downloader
  URL = 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'

  def download
    Net::HTTP.get(URI.parse(URL))
  end
end
