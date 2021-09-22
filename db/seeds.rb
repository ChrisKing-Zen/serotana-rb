require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars', { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
languageArray = %w[
  English
  Spanish
  French
  Japanese
  Korean
  Hindi
  Arabic
  German
  Polish
  Dutch
  Portuguese
  Italian
  Mandarin
  Russian
  Filipino
  Bengali
  Yoruba
  Igbo
  Greek
  Czech
]
modalitiesArray = [
  'EMDR',
  'CBT',
  'ACT',
  'Art Therapy',
  'Behavioral Therapy',
  'DBT',
  'Brief Psychotherapy',
  'Cient-Centered Therapy',
  'CFT',
  'Drama Therapy',
  'EFT',
  'Existential Therapy',
  'Gestalt Therapy',
  'Holistic Therapy',
  'Humanistic Therapy',
  'Hypnotherapy',
  'Existential Therapy',
  'Logotherapy',
  'Junguian Therapy',
  'Motivational Interviewing',
  'Music Therapy',
  'Narrative Therapy',
  'Object Relations Therapy',
  'Play Therapy',
  'Narrative Therapy',
  'Psychoanalysis',
  'Psychodrama',
  'Narrative Therapy',
  'Schema Therapy',
  'Structural Therapy',
  'TRU',
  'Animal-Assisted Therapy',
  'Psychodynamic Therapy',
  'Positive Psychology',
  'Feminist Therapy',
  'Sandplay Therapy',
  'Mindfulness-Based Cognitive Therapy',
  'Compassion-Focused Therapy',
  'Cognitive Therapy',
  'Somatic Experiencing',
  'Grief Therapy',
  'Life Transitions Therapy',
  'Alderian Psychotherapy',
  'Brainspotting',
  'Dance/Movement Therapy',
  'Ecotherapy',
  'Neuropsychlogy',
  'Reichian Therapy',
  'Transference-focused Therapy',
]
issuesArray = [
  'Depression',
  'Anxiety',
  'Life transition',
  'Grief',
  'Divorce',
  'Abuse',
  'ADHD',
  'Anger',
  'Personality Disorders',
  'Mood Disorders',
  'Relationship Issues',
  'Family Issues',
  'Autism Spectrum Disorder',
  'Guilt',
  'HIV/AIDS',
  'Body Image',
  'Identity Issues',
  'Isolation',
  'Chronic Pain',
  'Midlife Crisis',
  'Mood Swings',
  'Drug and Alcohol Addiction',
  'Performance Anxiety',
  'Phobias',
  'Life purpose',
  'Gender Dysphoria',
  'LGBTQI+ Issues',
  'Stress',
  'Suicide',
  'Self-Esteem Issues',
  'Self-Injury',
  'Self-Doubt',
  'Spirituality',
  'Self-Care',
  'Burnout',
  'Bullying',
  'Fertility Issues',
  'Trauma',
  'Young Adult Issues',
  'Burnout',
  'POC Issues',
]
# take from seeds in blitz and ctrl+d the shit out of things

puts 'Seeding DB'
puts 'Making Clients & Proposals'
5.times do
  user =
    User.create!(
      email: Faker::Internet.email,
      role: 'client',
      verified: Faker::Boolean.boolean,
      anonymized: Faker::Boolean.boolean,
    )
  client =
    Client.create!(
      onboarding_step: Faker::Boolean.boolean ? 0 : 1,
      user: user,
      seen_therapist: Faker::Boolean.boolean,
      birth_date: Faker::Date.between(from: 18.years.ago, to: 102.years.ago),
      taking_meds: Faker::Boolean.boolean,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: Faker::Address.country,
    )
  Language.create!(
    name: languageArray[Faker::Number.within(range: 0..languageArray.length)],
    client_id: client.id,
  )

  Insurance.create!(
    name: Faker::Lorem.word,
    state: Faker::Address.state,
    country: Faker::Address.country,
    client_id: client.id,
  )
  post =
    Post.create!(
      problems: Faker::Lorem.paragraph,
      expectations: Faker::Lorem.paragraph,
      setting_preference: Faker::Boolean.boolean ? 'online' : 'in-person',
      min_budget: Faker::Number.between(from: 30, to: 60),
      max_budget: Faker::Number.between(from: 90, to: 150),
      is_insured: Faker::Boolean.boolean,
      out_of_pocket_only: Faker::Boolean.boolean,
      active: Faker::Boolean.boolean,
      acquired_here: Faker::Boolean.boolean,
      anonymize: true,
      anonymization_date:
        Faker::Date.between(from: 1.days.from_now, to: 30.days.from_now),
      client_id: client.id,
    )
  SpecializedIssue.create!(
    name: issuesArray[Faker::Number.within(range: 0..issuesArray.length)],
    post_id: post.id,
  )
end

puts 'Making Therapists'

5.times do |i|
  user =
    User.create!(
      email: Faker::Internet.email,
      role: 'therapist',
      verified: Faker::Boolean.boolean,
      anonymized: Faker::Boolean.boolean,
    )

  Therapist.create!(
    user_id: user.id,
    firstName: Faker::Name.first_name,
    lastName: Faker::Name.last_name,
    description: Faker::Lorem.paragraphs,
    profile_image_url: Faker::LoremFlickr.image(size: '60x60'),
    therapy_process: Faker::Lorem.paragraphs,
    website_url: Faker::Internet.url,
    phone: Faker::PhoneNumber.phone_number,
    country: Faker::Address.country,
    birth_date: Faker::Date.between(from: 18.years.ago, to: 102.years.ago),
    setting_preference: Faker::Boolean.boolean ? 'online' : 'in-person',
    show_age: Faker::Boolean.boolean,
    onboarding_step: 0,
    languages_attributes: [{ name: languageArray.sample }],
    modalities_attributes: [{ name: modalitiesArray.sample }],
    specialized_issues_attributes: [{ name: issuesArray.sample }],
    addresses_attributes: [
      {
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        postal_code: Faker::Address.zip,
      },
    ],
    insurances_attributes: [
      {
        name: Faker::Lorem.word,
        state: Faker::Address.state,
        country: Faker::Address.country,
      },
      {
        name: Faker::Lorem.word,
        state: Faker::Address.state,
        country: Faker::Address.country,
      },
    ],
  )
end

puts 'Making Proposals'
Therapist.all.each do |therapist|
  Post.all.each do |post|
    Proposal.create!(
      message: Faker::Lorem.sentences(number: 3),
      therapist_id: therapist.id,
      post_id: post.id,
    )
  end
end
puts 'finished seeding'
