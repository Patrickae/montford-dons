class CreateChargeTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :charge_types do |t|
      t.string :name
      t.decimal :amount
      t.string :frequency

      t.timestamps
    end
  end
end
