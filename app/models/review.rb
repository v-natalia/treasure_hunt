class Review < ApplicationRecord
  belongs_to :user
  belongs_to :donation

  # ── Validations ───────────────────────────────────────────
  validates :points,  presence: true,
                      numericality: { only_integer: true, in: 1..5 }
  validates :role,    presence: true,
                      inclusion: { in: %w[donor receiver] }
  validates :comment, length: { maximum: 300 }

  # Un utilisateur ne peut laisser qu'un seul avis par donation et par rôle
  validates :user_id, uniqueness: {
    scope: [:donation_id, :role],
    message: "a déjà laissé un avis pour ce don"
  }

  # ── Scopes ────────────────────────────────────────────────
  scope :by_donor,    -> { where(role: "donor") }
  scope :by_receiver, -> { where(role: "receiver") }
end
