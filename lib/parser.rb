require 'nokogiri'

class Parser
  attr_reader :file
  attr_reader :result

  def initialize(file)
    @file = Nokogiri::XML(file)
  end

  def speakers
    file.search("SPEAKER").map(&:text)
  end

  def speeches
    file.search("SPEECH").map(&:text)
  end

  def lines
    file.search("LINE").map(&:text)
  end

  def speakers_and_lines
    file.search("SPEECH").map do |speech| 
      speaker = speech.search("SPEAKER").text
      lines = speech.search("LINE").map(&:text)
      { 
        speaker => lines
      }
    end 
  end

  def speakers_and_line_counts
    file.search("SPEECH").map do |speech| 
      speaker = speech.search("SPEAKER").text
      lines = speech.search("LINE").map(&:text)
      { 
        speaker => lines.count
      }
    end 
  end

  def speaker_line_counts
    speakers_and_line_counts.inject { |speaker, lines| speaker.merge(lines) { | x, val1, val2 | val1 + val2 }}
  end
end