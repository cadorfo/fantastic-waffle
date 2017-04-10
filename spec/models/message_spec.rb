require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "#translate_content!" do
    subject { message.translate_content! }
    let(:message) { create(:message) }
    before do
      allow(TranslateJob).to receive(:perform_later).with(message.id).and_return(true)
    end
    it { is_expected.to be_truthy }

  end
end
