# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  name                   :string(255)      default(""), not null
#  father_name            :string(255)
#  cnic                   :integer
#  phone                  :integer
#  address                :string(255)
#  role                   :string(255)      default("Consumer"), not null
#  terms                  :boolean          default(FALSE)
#  completed_profile      :boolean          default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  ROLES = %w[Consumer Admin Dealer]
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  before_update :check_completed_profile

  has_many :contact_details, dependent: :destroy
  accepts_nested_attributes_for :contact_details

  has_many :devices, dependent: :destroy
  accepts_nested_attributes_for :devices

  has_many :pending_requests, dependent: :destroy
  accepts_nested_attributes_for :pending_requests

  validates_confirmation_of :password, if: :re_valid
  def re_valid
    false
  end

  def check_completed_profile
    unless self.completed_profile
      unless self.name.blank? and self.cnic.blank? and self.phone.blank? and self.address.blank? and self.father_name.blank?
        self.completed_profile = true
      end
    end
  end
end
