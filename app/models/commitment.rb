class Commitment < ApplicationRecord
  belongs_to :user
  belongs_to :week
  validates :status, inclusion: { in: %w[pending going not_going withdrawn] }
  validates :week_id, uniqueness: {scope: :user_id, message: 'Only one commitment is allowed per user per week.'}

  enum :status, {
    pending: "pending",
    going: "going",
    not_going: "not_going",
    withdrawn: "withdrawn"
  }

  STATUS_CLASS_MAPPINGS = {
    pending: 'text-purple-600',
    going: 'text-green-600',
    not_going: 'text-red-600',
    withdrawn: 'text-orange-600'
}.freeze

  def status_text_html_class
    STATUS_CLASS_MAPPINGS[status.to_sym]
  end
end
