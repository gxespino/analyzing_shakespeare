require 'spec_helper'

describe Parser do 
  let(:sample_xml) { File.open("spec/fixtures/sample.xml") }
  let(:parser) { Parser.new(sample_xml) }

  it "parses an xml file for all the speakers" do 
    speakers = ["DUNCAN", "MALCOLM", "Sergeant", "DUNCAN"]

    expect(parser.speakers).to eq speakers 
  end

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

  it "parses an xml file for speakers and their total line count" do 
    expect(parser.speaker_line_counts["DUNCAN"]).to eq 6
    expect(parser.speaker_line_counts["MALCOLM"]).to eq 5
  end
end