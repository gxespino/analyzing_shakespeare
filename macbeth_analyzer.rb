require "./lib/analyzer"
require "./lib/downloader"
require "./lib/parser"
require "./lib/counter"

if __FILE__ == $0

  xml = Downloader.new.download

  hashed = Parser.new(xml).speakers_and_lines

  count = Counter.new(hashed).line_count_hash

  Analyzer.new(count).analyze

end
