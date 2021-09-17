module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :seen_therapist, Boolean, null: true
    field :taking_meds, Boolean, null: true
    field :country, String, null: true
    field :city, String, null: true
    field :state, String, null: true
    field :city_state, String, null: true, method: :city_state
    field :onboarding_step, Integer, null: true
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :age, String, null: false, method: :age
    field :post, Types::PostType, null: false

    def age
      diff = Date.today - object.birth_date
      age = (diff / 365.25).floor
      age.to_s
    end
  
    def city_state
      "#{object.city} #{object.state}"
    end
  end

  

end
