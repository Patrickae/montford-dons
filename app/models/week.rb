class Week < ApplicationRecord
  has_many :commitments, dependent: :destroy
  has_many :committed_users, through: :commitments, source: :user

  def self.current
    Week.where(date: Date.today.beginning_of_week..Date.today.end_of_week).first
  end

  def display_date
    date.strftime("%B %d, %Y")
  end

  def vs_opponent
    opponent.present? ? "vs #{opponent}" : "TBD"
  end
end
