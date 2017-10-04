class Message < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :conversation
end
