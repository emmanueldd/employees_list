# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  nickname               :string           default(""), not null
#  avatar                 :string
#  male                   :boolean
#  description            :text
#  birth_date             :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photos, as: :object
  has_many :messages, as: :sender
  has_many :addresses, as: :object
  has_many :bookings
  # has_and_belongs_to_many :conversations, as: :sender
  # has_and_belongs_to_many :conversations, as: :recipient
  # has_many :conversations, :class_name => "Message", :foreign_key  => "sender_id"
  # has_many :conversations, :class_name => "Message", :foreign_key  => "recipient_id"
  has_many :participants, as: :person, dependent: :destroy
  has_many :conversations, through: :participants
end
