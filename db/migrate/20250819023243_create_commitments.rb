class CreateCommitments < ActiveRecord::Migration[8.0]
  def change
    create_table :commitments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :week, null: false, foreign_key: true

      t.timestamps
    end
  end
end
