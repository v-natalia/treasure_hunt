class Message < ApplicationRecord
  belongs_to :user
  belongs_to :donation
  # ── Validations ───────────────────────────────────────────
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }

  # ── Scopes ────────────────────────────────────────────────
  scope :recent,       -> { order(created_at: :asc) }
  scope :conversation, ->(donation_id) { where(donation_id: donation_id) }
end
