# == Schema Information
#
# Table name: pros
#
#  id                     :integer          not null, primary key
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  nickname               :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Pro < ApplicationRecord

  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  devise :validatable, :omniauthable
  include Concerns::Oauth

  has_many :business_hours
  has_many :unavailabilities
  has_many :missions
  has_many :bookings
  has_many :photos, as: :object
  has_many :messages, as: :sender
  has_many :conversations, as: :sender
  has_many :conversations, as: :recipient

  accepts_nested_attributes_for :business_hours

  after_create :set_business_hours

  def set_business_hours
    (0..6).each do |index|
      business_hours.create(week_day: index)
    end
  end

  def self.find_for_google_oauth2(auth)
    super
  end



end
