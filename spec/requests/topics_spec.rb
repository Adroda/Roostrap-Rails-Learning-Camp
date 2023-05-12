# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name      :string
#  image       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe "Topics", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/topics/index"
      expect(response).to have_http_status(:success)
    end
  end

end
