require 'rails_helper'

RSpec.describe TranslateJob, :vcr, type: :job do
  describe "#perform" do
    subject { described_class.new.perform(message.id) }
    let(:message) { create :message }

    before do
      allow(ChatChannel).to receive(:broadcast_to).with(
        "chat_ChatRoom", {
        message: message,
        user: message.user,
        type: message.message_type
      }
      ).and_return(true)

      allow(message).to receive(:save!).with(no_args).and_return(true)
    end

    it { is_expected.to be_truthy }
  end
end
