class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ── Associations ──────────────────────────────────────────
  has_many :donations, dependent: :destroy
  has_many :reviews,   dependent: :destroy
  has_many :messages,  dependent: :destroy

  # ── Validations ───────────────────────────────────────────
  # validates :first_name, presence: true
  # validates :last_name,  presence: true

  # ── Hunter levels ─────────────────────────────────────────
  HUNTER_LEVELS = %w[bronze silver gold platinum].freeze

  # validates :hunter_level,
  #           inclusion: { in: HUNTER_LEVELS },
  #           allow_nil: true

  # Calcule le niveau Hunter selon le nombre de dons
  def compute_hunter_level
    count = donations.count
    case count
    when 0..4   then "bronze"
    when 5..14  then "silver"
    when 15..29 then "gold"
    else             "platinum"
    end
  end

  def update_hunter_level!
    update!(hunter_level: compute_hunter_level)
  end
end
