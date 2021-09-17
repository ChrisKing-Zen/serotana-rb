class PaymentMethod < ApplicationRecord
  belongs_to :payment_option
end
