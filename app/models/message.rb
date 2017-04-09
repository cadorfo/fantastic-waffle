class Message < ApplicationRecord
  belongs_to :user

  validates :content, presence: false

  def tranlate_content
    TranslateJob.perform_later(self.id)
  end
end
