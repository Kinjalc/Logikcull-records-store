class ArtistRecordAssociation < ApplicationRecord
  belongs_to :record
  belongs_to :artist
end
