require 'rails_helper'

describe "update a record", :type => :request do
  let(:artists){ create_list :artist, 3 }
  let(:record){ create :record, artist_ids: [artists[0].id, artists[1].id]}

  before do
      get "/api/v1/records/#{record.id}"
  end

  it 'creates record & returns 200 http status' do
    expect(response.status).to eq(200)
  end

  it 'returns the record in response' do
    expect(JSON.parse(response.body)['title']).to eq(record.title)
    expect(JSON.parse(response.body)['year']).to eq(record.year)
    expect(JSON.parse(response.body)['condition']).to eq(record.condition)
    expect(JSON.parse(response.body)['artists']).to eq([{'id'=> artists[0].id, 'name'=> artists[0].name}, {'id'=> artists[1].id, 'name'=> artists[1].name}])
  end

end
