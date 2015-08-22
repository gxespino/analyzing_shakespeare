require 'spec_helper'

describe Parser do
  let(:sample_xml) { File.open("spec/fixtures/sample.xml") }
  let(:parser) { Parser.new(sample_xml) }
  let(:double_speaker_sample) { File.open("spec/fixtures/double_speaker_sample.xml") }
  let(:double_speaker_parser) { Parser.new(double_speaker_sample) }

  it "parses an xml file for speakers and their lines" do
    duncan_lines = {
                     "DUNCAN" => [ "What bloody man is that? He can report,",
                                   "As seemeth by his plight, of the revolt",
                                   "The newest state." ]
                   }

    malcolm_lines = {
                      "MALCOLM" => [ "This is the sergeant",
                                     "Who like a good and hardy soldier fought",
                                     "'Gainst my captivity. Hail, brave friend!",
                                     "Say to the king the knowledge of the broil",
                                     "As thou didst leave it." ]
                    }

    expect(parser.speakers_and_lines[0]).to eq duncan_lines
    expect(parser.speakers_and_lines[1]).to eq malcolm_lines
  end

  it "parses for separate speakers speaking at the same time" do
    expect(double_speaker_parser.speakers_and_lines.flat_map(&:keys)).not_to include("DUNCANMALCOLM")
  end
end
