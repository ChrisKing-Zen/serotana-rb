class CreateLicenses < ActiveRecord::Migration[6.1]
  def change
    create_table :licenses do |t|
      t.string :name
      t.string :state
      t.string :country
      t.string :photo_url
      t.references :user, null: false, foreign_key: true
      t.references :therapist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
