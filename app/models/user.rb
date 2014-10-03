# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      not null
#  encrypted_password     :string(255)      not null
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
#  full_name              :string(255)      not null
#  father_name            :string(255)
#  cnic                   :integer          not null
#  phone                  :integer          not null
#  address                :integer
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :name, presence: true
  validates :cnic, presence: true, uniqueness: true, length: { is: 13 }
  validates :phone, presence: true, uniqueness: true, length: { is: 10 }

  has_many :contact_informations, dependent: :destroy
  accepts_nested_attributes_for :contact_informations

  has_many :devices,              dependent: :destroy
  accepts_nested_attributes_for :devices

  validates_confirmation_of :password, if: :re_valid
  def re_valid
    false
  end
end
