class Counter
  attr_reader :parsed_hash

  def initialize(parsed_hash)
    @parsed_hash = parsed_hash
  end

  def line_count(speaker)
    consolidate_lines[speaker].count
  end

  private

  def consolidate_lines
    parsed_hash.inject { |speaker, lines| speaker.merge(lines) { |speaker, val_1, val_2 | val_1 + val_2 }}
  end
end