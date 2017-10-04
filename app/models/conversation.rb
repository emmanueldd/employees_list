class Conversation < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :recipient, polymorphic: true
  has_many :messages

  def message
    messages.last.body
  end
end
