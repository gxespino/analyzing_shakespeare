require "spec_helper"

describe Counter do 
  let(:sample_xml) { File.open("spec/fixtures/sample.xml") }
  let(:parser) { Parser.new(sample_xml) }

  it "counts the number of lines for a speaker" do
    hashed = parser.speakers_and_lines

    counter = Counter.new(hashed)

    expect(counter.line_count("DUNCAN")).to eq 6 
    expect(counter.line_count("MALCOLM")).to eq 5
    expect(counter.line_count("Sergeant")).to eq 17
  end
end