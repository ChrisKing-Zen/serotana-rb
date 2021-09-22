module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :posts,
          [Types::PostType],
          null: false,
          description: 'Returns a list of posts'

    field :proposals,
          [Types::ProposalType],
          null: false,
          description: 'Returns a list of proposals'

    field :therapists,
          [Types::TherapistType],
          null: false,
          description: 'Returns a list of therapists'

    field :post, Types::PostType, null: false, description: 'Returns a post' do
      argument :id, Integer, required: true
    end
    field :post_proposals,
          [Types::ProposalType],
          null: false,
          description: 'Returns proposals from post' do
      argument :post_id, Integer, required: true
    end
    field :therapist_proposals,
          [Types::ProposalType],
          null: false,
          description: 'Returns proposals from therapist' do
      argument :therapist_id, Integer, required: true
    end
    field :therapist,
          Types::TherapistType,
          null: false,
          description: 'Returns a therapist' do
      argument :id, Integer, required: true
    end
    field :proposal,
          Types::ProposalType,
          null: false,
          description: 'Returns a proposal' do
      argument :id, Integer, required: true
    end

    def posts
      Post.all
    end

    def post_proposals(post_id:)
      Post.find(post_id).proposals
    end

    def therapist_proposals(therapist_id:)
      Therapist.find(therapist_id).proposals
    end

    def therapists
      Therapist.all
    end

    def post(id:)
      Post.find(id)
    end

    def therapist(id:)
      Therapist.find(id)
    end

    def proposal(id:)
      Proposal.find(id)
    end
  end
end
