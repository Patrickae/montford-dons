class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :commitments, dependent: :destroy
  has_many :committed_weeks, through: :commitments, source: :week

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def full_name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name[0]}#{last_name[0]}".upcase
  end

  def committed_to?(week)
    commitments.exists?(week: week)
  end
end
