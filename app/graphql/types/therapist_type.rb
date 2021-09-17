module Types
  class TherapistType < Types::BaseObject
    field :id, ID, null: false
    field :firstName, String, null: true
    field :lastName, String, null: true
    field :description, String, null: true
    field :profile_image_url, String, null: true
    field :therapy_process, String, null: true
    field :website_url, String, null: true
    field :phone, String, null: true
    field :country, String, null: true
    field :birth_date, String, null: true
    field :setting_preference, String, null: true
    field :show_age, Boolean, null: true
    field :onboarding_step, Integer, null: true
    field :proposals, [Types::ProposalType], null: false
    field :proposal_count, Integer, null:false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def proposal_count
      object.proposals.length
    end
    
  end
end
