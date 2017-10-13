class Conversation < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants, source: :person, source_type: 'User'
  has_many :pros, through: :participants, source: :person, source_type: 'Pro'
  # belongs_to :sender, polymorphic: true
  # belongs_to :recipient, polymorphic: true
  has_many :messages, dependent: :destroy
  belongs_to :booking

  def message
    messages.last.body if messages.present?
  end
  def last_message
    messages.last if messages.present?
  end
end
