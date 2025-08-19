class CreateWeeks < ActiveRecord::Migration[8.0]
  def change
    create_table :weeks do |t|
      t.date :date
      t.string :opponent
      t.string :lanes

      t.timestamps
    end
  end
end
