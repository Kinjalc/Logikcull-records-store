class Artist < ApplicationRecord
  include ActiveModel::Validations

  paginates_per 50

  has_many :artist_record_associations
  has_many :records, through: :artist_record_associations

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
