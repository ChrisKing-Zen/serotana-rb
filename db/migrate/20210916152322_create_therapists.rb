class CreateTherapists < ActiveRecord::Migration[6.1]
  def change
    create_table :therapists do |t|
      t.string :firstName
      t.string :lastName
      t.text :description
      t.string :profile_image_url
      t.text :therapy_process
      t.string :website_url
      t.string :phone
      t.string :country
      t.string :birth_date
      t.string :setting_preference
      t.boolean :show_age
      t.integer :onboarding_step
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

  end
end
