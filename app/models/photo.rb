# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  object_type :string
#  object_id   :integer
#  photo       :string
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :object, polymorphic: true
end
