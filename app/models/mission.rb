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

class Mission < ApplicationRecord
  belongs_to :pro, optional: true
  belongs_to :parent, class_name: 'Mission', foreign_key: 'parent_id', optional: true
  has_many :childrens, class_name: 'Mission'

  scope :parent_missions, -> { where(parent_id: nil) }

  def missions
    Mission.where(parent: self)
  end
end
