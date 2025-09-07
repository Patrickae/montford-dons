 class AddStatusToCommitments < ActiveRecord::Migration[8.0]
  def change
    add_column :commitments, :status, :string, default: "pending"
  end
end
