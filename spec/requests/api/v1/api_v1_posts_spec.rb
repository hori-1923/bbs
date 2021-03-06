# coding: utf-8
require 'spec_helper'

describe "Api::V1::Posts" do
  describe "GET /api/v1/posts.json" do
    before do
      10.times { FactoryGirl.create(:post) }
    end

    it 'ステータスコード200が返る' do
      get api_v1_posts_path, format: :json
      expect(response.status).to eq(200)
    end

    it '10個の投稿が返る' do
      get api_v1_posts_path, format: :json
      json = JSON.parse(response.body)
      expect(json.count).to eq(10)
    end

    it '必要な属性がある' do
      get api_v1_posts_path, format: :json
      json = JSON.parse(response.body)
      json.each do |data|
        expect(data.keys).to match_array(['title', 'name', 'body'])
      end
    end

  end

  describe "POST /api/v1/posts" do
  	context '正しいパラメーターを送った時' do
  		let(:params){
  			{
  				post: FactoryGirl.attributes_for(:post),
  				format: :json
  			}
  		}
  		it 'ステータスコード２００を返す' do
  			post api_v1_posts_path, params
      		expect(response.status).to eq(201)
  		end
  		it '投稿が保存できる' do
  			expect{
  				post api_v1_posts_path, params
  			}.to change{ Post.count }.by(1)
  			#before_count = Post.count
  			#post api_v1_posts_path, params
  			#after_count = Post.count
  			#expect((before_count + 1) == after_count).to be_ture
  		end
  	end

  	context '不正なパラメーターを送った時' do
  		let(:params){
  			{
  				post: FactoryGirl.attributes_for(:post, name: 'a'),
  				format: :json
  			}
  		}
  		it 'ステータスコード４２２を返す' do
  			post api_v1_posts_path, params
      		expect(response.status).to eq(422)
  		end
  		it 'エラーメッセージが返る' do
  			post api_v1_posts_path, params
  			expect(response.body).not_to eq('')
  		end
  	end
  end

  	describe 'PATCH /api/v1/posts/:id' do
  		let(:post){ 	FactoryGirl.create(:post)	}

  		context '正しいパラメータを送ったとき' do
	  		let(:params){
	  			{
	  				post: FactoryGirl.attributes_for(:post, name: 'a'),
	  				format: :json
	  			}
	  		}
	  		it 'ステータスコードは２００' do
  				patch api_v1_post_path(post.id), params
  				expect(response_status).to eq(200)
	  		end
	  		it '値が更新される' do
	  			expect{
	  				patch api_v1_posts_path(post.id), params
	  			}.to change{ Post.find(post.id).title }
	  			#before_title = Post.find(post.id).title
  				#patch api_v1_post_path(post.id), params
  				#after_title = Post.find(post.id).title
  				#expect(before_title != after_title).to be_ture
	  		end
  		end

  		context '不正なパラメータを送った時' do
	  		let(:params){
	  			{
	  				post: FactoryGirl.attributes_for(:post, name: 'a'),
	  				format: :json
	  			}
	  		}
	  		it 'ステータスコードは422' do
  				expect(response_status).to eq(422)
	  		end
	  		it '値が更新されない時' do
	  			expect{
	  				patch api_v1_posts_path(post.id), params
	  			}.not_to change{ Post.find(post.id).title }
	  		end
  		end
	end

	describe 'DELETE /api/v1/posts/:id' do
  		let!(:post){ 	FactoryGirl.create(:post)	}

		it '削除される' do
			#before_count = Post.count
  			#delete api_v1_post_path(post)
  			#after_count = Post.count

  			#expect((before_count - 1) == after_count).to be_ture
  			expect{
  				delete api_v1_post_path(post)
  			}.to change{ Post.count }.by(-1)
		end
	end
end
