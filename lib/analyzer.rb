class Analyzer
  attr_reader :line_hash_array

  def initialize(line_hash_array)
    @line_hash_array = line_hash_array
    @sorted_hash = Hash.new(0)
  end

  def analyze
    #Generally better to use self.foo or @foo so that you don't accidently introduce a variable right above with the same name
    hash = @line_hash_array.reduce(Hash.new, :merge)
    
    #Each line should have a single clear intention. Previously, it would of been "reverse sort and print". When you have an 'and' in your intent, likely you want to break it up
    @sorted_hash = hash.sort_by { |key, value| value }.reverse.to_h
    @sorted_hash.each do |k, v|
      puts "#{v} #{k}"
    end
    
    @sorted_hash
  end
end
