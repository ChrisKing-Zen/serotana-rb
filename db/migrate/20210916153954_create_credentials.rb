class CreateCredentials < ActiveRecord::Migration[6.1]
  def change
    create_table :credentials do |t|
      t.string :major
      t.string :level
      t.string :type
      t.string :location
      t.boolean :display
      t.integer :year_achieved
      t.string :photo_url
      t.boolean :verified
      t.references :user, null: false, foreign_key: true
      t.references :therapist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
