class Therapist < ApplicationRecord
  belongs_to :language
  belongs_to :modality
  belongs_to :proposal
  belongs_to :specialized_issue
  belongs_to :faith
  belongs_to :alliance
  belongs_to :address
  belongs_to :contact_info
  belongs_to :credential
  belongs_to :payment_option
  belongs_to :license
  belongs_to :report
end
