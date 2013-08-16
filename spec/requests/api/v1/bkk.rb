# coding: utf-8
require 'spec_helper'

describe "Api::V1::Posts" do
  describe "GET /api/v1/posts.json" do
    before do
    	10.times do
    		FactoryGirl.create(:post)
    	end
    end

    it 'レスポンスコードが２００' do
    	get api_v1_posts_path, format: :json
      	expect(response.status).to eq(200)
    end

 #   it '１０個の投稿がかえってくる' do
  #  	get api_v1_posts_path, format: :json
  #  	json = JSON::perse(response.body).tapp
  #    	expect(json.count).to eq(10)
  #  end

	it '各要素は title, name, body 属性を持つ' do
      get api_v1_posts_path, format: :json
      json = JSON.parse(response.body)
      json.each do |data|
        keys = data.keys
        expect(keys).to match_array(['title', 'name', 'body'])
    end
    
  	#it '必要な属性がある' do
  	#	get api_v1_posts_path, format: :json
  	#	json = JSON.perse(response.body)
  	#	json.each do | data |
  	#		expect(data.keys).to match_array(['title', 'name', 'body'])
  	#	end
  	#end

  end
end
