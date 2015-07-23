require 'nokogiri'

class Parser
  attr_reader :file
  attr_reader :result

  def initialize(file)
    @file = Nokogiri::XML(file)
  end

  def speakers_and_lines
    search_for(file, "SPEECH").map do |speech| 
      speaker = search_for(speech, "SPEAKER").text
      lines = search_for(speech, "LINE").map(&:text)
      { 
        speaker => lines
      }
    end 
  end

  private

  def search_for(source, text)
    source.search(text)
  end
end