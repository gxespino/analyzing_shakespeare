class Analyzer
  attr_reader :line_hash_array

  def initialize(line_hash_array)
    @line_hash_array = line_hash_array
    @sorted_hash = Hash.new(0)
  end

  def analyze
    hash = line_hash_array.reduce(Hash.new, :merge)
    @sorted_hash = hash.sort_by { |_key, value| value }.reverse.to_h.each do |k, v|
      puts "#{v} #{k}"
    end
    @sorted_hash
  end
end