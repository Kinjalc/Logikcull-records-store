require 'rails_helper'

describe "post a record", :type => :request do
  let(:artist){ create :artist }
  let(:params){ { :title => Faker::Lorem.sentence, :year => Faker::Number.number(digits: 4), :artist_ids =>[artist.id], :condition => 'fair' } }

  before do
      post '/api/v1/records', params: params
  end

  it 'creates record & returns 200 http status' do
    expect(response.status).to eq(200)
  end

  it 'creates record & returns it' do
    expect(JSON.parse(response.body)['title']).to eq(params[:title])
    expect(JSON.parse(response.body)['year']).to eq(params[:year])
    expect(JSON.parse(response.body)['condition']).to eq(params[:condition])
    expect(JSON.parse(response.body)['artists']).to eq([{'id'=> artist.id, 'name'=> artist.name}])
  end
  
end
