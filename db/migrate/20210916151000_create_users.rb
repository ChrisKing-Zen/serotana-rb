class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :role
      t.boolean :verified
      t.string :verification
      t.boolean :anonymized
      t.string :anonymousToken

      t.timestamps
    end
  end
end
