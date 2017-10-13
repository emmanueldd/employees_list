class Participant < ApplicationRecord
  belongs_to :person, polymorphic: true
  belongs_to :conversation
end
