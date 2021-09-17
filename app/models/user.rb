class User < ApplicationRecord
  has_one :client, dependent: :destroy
  has_one :therapist, dependent: :destroy
end
