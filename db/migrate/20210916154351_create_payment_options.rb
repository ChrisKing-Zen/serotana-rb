class CreatePaymentOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_options do |t|
      t.integer :min_rate
      t.integer :max_rate
      t.string :category
      t.boolean :sliding_scale
      t.references :therapist, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
