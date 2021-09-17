class PaymentOption < ApplicationRecord
  belongs_to :therapist
  has_many :payment_method, dependent: :destroy
end
