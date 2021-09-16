class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :postal_code
      t.string :state
      t.references :therapist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
