require "spec_helper"

describe Counter do 
  it "counts the number of lines for a speaker"

  expect(counter.lines("DUNCAN")).to eq 6 
  expect(counter.lines("MALCOLM")).to eq 5
end

# "DUNCAN" => [ "What bloody man is that? He can report,",
#               "As seemeth by his plight, of the revolt",
#               "The newest state." ]