class Record < ApplicationRecord
  include ActiveModel::Validations

  paginates_per 50

  enum condition: {sealed: 1, mint: 2, near_mint: 2, very_good_plus: 3, very_good: 4, good: 5, fair:6, poor: 7}

  has_many :artist_record_associations, dependent: :destroy
  has_many :artists, through: :artist_record_associations

  before_validation :validate_artist, on: :create

  validates :title, presence: true
  validates :condition, presence: true
  validates :title, uniqueness: { scope: [:year, :condition],
    message: "already exists" }

  private
  def validate_artist
    if artist_ids.blank?
      errors.add(:base, "Please add atleast one artist")
    else
      valid_artist_ids = Artist.where(id: artist_ids).pluck(:id)
      invalid_artist_ids = artist_ids - valid_artist_ids
      if invalid_artist_ids.present?
        errors.add(:base, "The following artist_ids are invalid #{invalid_artist_ids}")
      end
    end
  end
end
