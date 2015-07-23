require 'nokogiri'

class Parser
  attr_reader :file
  attr_reader :result

  # This is technically an xml_string and not a file.
  def initialize(file)
    @file = Nokogiri::XML(file)
  end

  def speakers_and_lines
    # I may argue that this would make more since as a .each loop where you add {speaker => lines} into a hash
    # This would normalize the data that you then use in the next step. Generally speaking, the format of data should be as simple and straight foward as possible when leaving one object to another. 
    search_for(file, "SPEECH").map do |speech| 
      speaker = search_for(speech, "SPEAKER").text
      lines = search_for(speech, "LINE").map(&:text)
      { 
        speaker => lines
      }
    end 
  end

  private

  # There could be an argument that this method is extraneous and it would be more clear to just see #search above.
  def search_for(source, text)
    source.search(text)
  end
end
