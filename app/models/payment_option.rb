class PaymentOption < ApplicationRecord
  belongs_to :therapist
  belongs_to :payment_method
end
