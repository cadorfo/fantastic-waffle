class Message < ApplicationRecord
  belongs_to :user

  validates :content, presence: false

  def self.recent_messages
    self.order(updated_at: :desc).take(10)
  end

  def tranlate_content!
    TranslateJob.perform_later(self.id)
  end
end
