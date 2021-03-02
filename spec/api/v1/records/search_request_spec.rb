require 'rails_helper'

describe "search records", :type => :request do
  let(:artists){ create_list :artist, 3 }
  let(:search_word_artist){ create :artist, name: 'Tofoo name' }

  let!(:records){ create_list :record,3, artist_ids: [artists[0].id]}
  let!(:search_word_record1){ create :record, title:'Foo Bar',artist_ids: [artists[1].id] }
  let!(:search_word_record2){ create :record, title:'randomFoo bar',artist_ids: [artists[0].id] }
  let!(:search_word_artist_record){ create :record, title:'randomFoo bar',artist_ids: [search_word_artist.id] }

  before do
      get "/api/v1/records/search?q=foo"
  end

  it 'returns 200 http status' do
    expect(response.status).to eq(200)
  end

  it 'returns the records where the search query found in the title ' do
    expect(JSON.parse(response.body)[0]['title']).to eq(search_word_record1.title)
    expect(JSON.parse(response.body)[1]['title']).to eq(search_word_record2.title)
  end

  it 'returns the records where the search query found in the artist name ' do
    expect(JSON.parse(response.body)[2]['title']).to eq(search_word_artist_record.title)
  end


end
