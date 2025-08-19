class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :week, null: false, foreign_key: true
      t.references :charge_type, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :total_paid
      t.date :paid_on

      t.timestamps
    end
  end
end
