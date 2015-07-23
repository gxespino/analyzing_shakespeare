class Counter
  attr_reader :parsed_hash

  def initialize(parsed_hash)
    @parsed_hash = parsed_hash
  end

  def line_count(speaker)
    consolidate_lines[speaker].count
  end

  def consolidate_lines
    parsed_hash.inject { |speaker, lines| speaker.merge(lines) { |x, val_1, val_2 | val_1 + val_2 }}
  end

  def line_count_hash
    consolidate_lines.map do |speaker, lines_array|
      { speaker => consolidate_lines[speaker].count }
    end
  end
end