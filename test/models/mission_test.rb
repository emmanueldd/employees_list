# == Schema Information
#
# Table name: missions
#
#  id          :integer          not null, primary key
#  parent_id   :integer
#  pro_id      :integer
#  name        :string
#  description :text
#  price       :decimal(8, 2)
#  duration    :integer
#  published   :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
