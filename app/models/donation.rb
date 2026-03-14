class Donation < ApplicationRecord
  belongs_to :user
  has_many   :reviews,  dependent: :destroy
  has_many   :messages, dependent: :destroy
  has_many_attached :photos
  # ── Validations ───────────────────────────────────────────
  validates :name,        presence: true
  validates :category,    presence: true, inclusion: { in: %w[
    furniture clothes toys books electronics
    sports garden kitchen tools art other
  ]}
  validates :condition,   presence: true, inclusion: { in: %w[
    new very_good good fair
  ]}
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  validates :address,     presence: true

  # ── Geocoding (gem geocoder) ──────────────────────────────
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # ── Scopes ────────────────────────────────────────────────
  scope :by_category, ->(cat)  { where(category: cat) if cat.present? }
  scope :by_condition, ->(con) { where(condition: con) if con.present? }
  scope :recent,       ->      { order(created_at: :desc) }
  scope :near_location, ->(lat, lng, dist = 5) {
    near([lat, lng], dist, units: :km)
  }

  # ── Enums ─────────────────────────────────────────────────
  CATEGORIES = %w[
    furniture clothes toys books electronics
    sports garden kitchen tools art other
  ].freeze
  CONDITIONS = %w[new very_good good fair].freeze
end
