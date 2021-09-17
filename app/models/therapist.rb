class Therapist < ApplicationRecord
  belongs_to :user
  belongs_to :faith, optional: true
  belongs_to :alliance, optional: true
  has_many :language
  has_many :modality
  has_many :proposal
  has_many :specialized_issue
  has_many :address
  has_many :contact_info
  has_many :credential
  has_many :payment_option
  has_many :license
  has_many :report

  accepts_nested_attributes_for :language
  accepts_nested_attributes_for :modality
  accepts_nested_attributes_for :proposal
  accepts_nested_attributes_for :specialized_issue
  accepts_nested_attributes_for :faith
  accepts_nested_attributes_for :alliance
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :contact_info
  accepts_nested_attributes_for :credential
  accepts_nested_attributes_for :payment_option
  accepts_nested_attributes_for :license
 
end
