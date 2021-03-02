class CreateArtistRecordAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_record_associations do |t|
      t.references :record, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
