class CreateContactInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_infos do |t|
      t.string :name
      t.string :url
      t.references :therapist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
