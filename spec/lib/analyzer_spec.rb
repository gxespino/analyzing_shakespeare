require 'spec_helper'

describe Analyzer do 
  let(:sample_xml) { File.open("spec/fixtures/sample.xml") }
  let(:parser) { Parser.new(sample_xml)}

  it "prints the correct number of lines for characters in an descending fashion" do
    result = { "Sergeant"=>17, "DUNCAN"=>6, "MALCOLM"=>5 }

    hashed = parser.speakers_and_lines

    counter = Counter.new(hashed)

    counted_lines = counter.line_count_hash

    analyzer = Analyzer.new(counted_lines).analyze

    expect(analyzer).to eq result
  end
end