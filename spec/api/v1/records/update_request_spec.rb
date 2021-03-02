require 'rails_helper'

describe "update a record", :type => :request do
  let(:artists){ create_list :artist, 3 }
  let(:record){ create :record, artist_ids: [artists[0].id, artist[2].id]}
  let(:params){ { :title => Faker::Lorem.sentence, :year => Faker::Number.number(digits: 4), :artist_ids =>[artists[1].id], :condition => 'fair' } }

  before do
      patch "/api/v1/records/#{record.id}", params: params
  end

  it 'returns 200 http status' do
    expect(response.status).to eq(200)
  end

  it 'updates and returns the updated record' do
    expect(JSON.parse(response.body)['title']).to eq(params[:title])
    expect(JSON.parse(response.body)['year']).to eq(params[:year])
    expect(JSON.parse(response.body)['condition']).to eq(params[:condition])
    expect(JSON.parse(response.body)['artists']).to eq([{'id'=> artists[1].id, 'name'=> artists[1].name}])
  end

end
