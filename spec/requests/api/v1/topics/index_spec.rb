# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe 'Topics', type: :request do
  subject { get api_v1_topics_path, headers: auth_headers, as: :json }

  let(:user) { create(:user) }

  describe 'GET /index' do
    it 'returns http success' do
      subject
      expect(response).to have_http_status(:success)
    end
  end
end
