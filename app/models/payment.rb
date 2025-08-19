class Payment < ApplicationRecord
  belongs_to :week
  belongs_to :charge_type
  belongs_to :user
end
