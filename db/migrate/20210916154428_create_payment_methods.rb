class CreatePaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.string :icon
      t.references :payment_options

      t.timestamps
    end
  end
end
