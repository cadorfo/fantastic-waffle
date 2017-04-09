require 'rails_helper'

describe BabelTranslator , :vcr do

  describe "#translate" do
    subject(){ described_class.translate(content:content, type: message_type) }
    let(:content) { "My name is Carlos"}
    let(:message_type) { "yoda"}
    it 'translate to yodas dialect ' do

      is_expected.to eq "Carlos, my name is"
    end
  end

end