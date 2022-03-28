require 'rails_helper'

RSpec.describe Idea, type: :model do
  
  it '全てのポストを取得する' do
    FactoryBot.create_list(:idea, 10)

    get '/idea/index'
    json = JSON.parse(response.body)
    expect(response.status).to eq(201)
    expect(json['body'].length).to eq(10)    
  end

  it '特定のpostを取得する' do
    idea = create(:idea, category_name: 'name')

    get "/idea/index/#{item.id}"
    json = JSON.parse(response.body)

    expect(response.status).to eq(201)
    expect(json['data']['category_name']).to eq(idea.category_name)
  end

  it '新しいideaを作成する' do
    valid_params = { category_name: 'name' }
    expect(response.status).to eq(201)
  end
end