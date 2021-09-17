class Language < ApplicationRecord
  belongs_to :therapist , optional: true
  belongs_to :user, optional: true
  belongs_to :client, optional: true
end
