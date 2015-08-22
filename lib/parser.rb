require 'nokogiri'
require 'pry'

class Parser
  attr_reader :file
  attr_reader :result

  def initialize(file)
    @file = Nokogiri::XML(file)
  end

  def speakers_and_lines
    search_for(file, "SPEECH").flat_map do |speech|
      speakers = search_for(speech, "SPEAKER")
      speakers.map do |speaker_element|
        lines = search_for(speech, "LINE").map(&:text)
          {
            speaker_element.text => lines
          }
      end
    end
  end

  private

  def search_for(source, text)
    source.search(text)
  end
end
