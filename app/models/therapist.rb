class Therapist < ApplicationRecord
  belongs_to :user
  belongs_to :reports
  has_one :faith
  has_many :alliances
  has_many :languages
  has_many :modalities
  has_many :proposals, dependent: :destroy
  has_many :specialized_issues
  has_many :addresses, dependent: :destroy
  has_many :contact_infos, dependent: :destroy
  has_many :credentials, dependent: :destroy
  has_many :payment_options, dependent: :destroy
  has_many :licenses, dependent: :destroy
  has_many :insurances, dependent: :destroy

  accepts_nested_attributes_for :languages
  accepts_nested_attributes_for :modalities
  accepts_nested_attributes_for :proposals
  accepts_nested_attributes_for :specialized_issues
  accepts_nested_attributes_for :faith
  accepts_nested_attributes_for :alliances
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :contact_infos
  accepts_nested_attributes_for :credentials
  accepts_nested_attributes_for :payment_options
  accepts_nested_attributes_for :licenses
  accepts_nested_attributes_for :insurances
 
end
