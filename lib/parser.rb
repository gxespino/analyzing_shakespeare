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

  def speakers_and_line_counts
    search_for(file, "SPEECH").map do |speech| 
      speaker = search_for(speech, "SPEAKER").text
      lines = search_for(speech, "LINE").map(&:text)
      { 
        speaker => lines.count
      }
    end 
  end

  def speaker_line_counts
    speakers_and_line_counts.inject { |speaker, lines| speaker.merge(lines) { | speaker, val1, val2 | val1 + val2 }}
  end

  private

  def search_for(source, text)
    source.search(text)
  end
end